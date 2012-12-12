module MyMoipRails
  class PurchasesController < BaseController
    def notification
      render nothing: true, status: :ok
    end
  end
end
