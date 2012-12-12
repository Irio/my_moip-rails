require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  def done_params
    {
      id_transacao: "942721",
      valor: "10050",
      status_pagamento: "4",
      cod_moip: "69862",
      forma_pagamento: "37",
      tipo_pagamento: "CartaoDeCredito",
      parcelas: "1",
      email_consumidor: "bla@foo.com",
      cartao_bin: "471620",
      cartao_final: "0696",
      cartao_bandeira: "Visa",
      cofre: "a6119105-2834-44b3-87ee-ce2c433a69be"
    }
  end

  def in_review_params
    {
      id_transacao: "942721",
      valor: "10050",
      status_pagamento: "6",
      cod_moip: "69862",
      forma_pagamento: "37",
      tipo_pagamento: "CartaoDeCredito",
      parcelas: "1",
      email_consumidor: "bla@foo.com",
      cartao_bin: "471620",
      cartao_final: "0696",
      cartao_bandeira: "Visa",
      cofre: "a6119105-2834-44b3-87ee-ce2c433a69be"
    }
  end

  def setup
    @controller = MyMoipRails::PurchasesController.new
  end

  def teardown
    if @controller.respond_to?(:original_notification)
      @controller.class.class_eval do
        alias_method :notification, :original_notification
      end
      @controller.class.instance_eval do
        remove_method(:original_notification)
      end
    end
  end

  test "should receive post notifications" do
    post :notification, done_params
    assert_response :success
  end

  test "should render blank response for notifications" do
    post :notification, done_params
    assert @response.body.blank?, 'should be blank'
  end

  test "logs every notification" do
    logger = stub
    Rails.stubs(:logger).returns(logger)
    logger.expects(:info).with(regexp_matches(/MyMoipRails notification received/))
    post :notification, done_params
  end

  test "should run block given to 'done' method in requests with status '4'" do
    payment_entity = stub
    @controller.class.class_eval do
      alias_method :original_notification, :notification
    end
    @controller.class.send(:define_method, :notification) do
      original_notification
      done do
        payment_entity.pay!
      end
    end
    payment_entity.expects(:pay!).once
    post :notification, done_params
  end

  test "should not run block given to 'done' method in requests with status other than '4'" do
    payment_entity = stub
    @controller.class.class_eval do
      alias_method :original_notification, :notification
    end
    @controller.class.send(:define_method, :notification) do
      original_notification
      done do
        payment_entity.pay!
      end
    end
    payment_entity.expects(:pay!).never
    post :notification, in_review_params
  end
end
