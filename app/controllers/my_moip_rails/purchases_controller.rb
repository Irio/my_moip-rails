module MyMoipRails
  class PurchasesController < BaseController
    def notification
      Rails.logger.info("MyMoipRails notification received with #{params.inspect}")
      render nothing: true, status: :ok
    end
  end
end
