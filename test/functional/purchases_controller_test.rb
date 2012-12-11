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

  test "should receive post notifications" do
    post :notification, done_params
    assert_response :success
  end

  test "should render blank response for notifications" do
    post :notification, done_params
    assert @response.body.blank?, 'should be blank'
  end
end
