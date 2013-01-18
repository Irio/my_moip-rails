module MyMoipRails
  class BaseController < ApplicationController
    helper_method :done, :canceled

    def done
      yield if params[:status_pagamento].eql?('4')
    end

    def canceled
      yield if params[:status_pagamento].eql?('5')
    end
  end
end
