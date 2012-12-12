module MyMoipRails
  class PurchasesController < ApplicationController
    def notification
      render nothing: true, status: :ok
    end
  end
end
