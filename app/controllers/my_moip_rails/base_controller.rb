module MyMoipRails
  class BaseController < ApplicationController
    helper_method :done, :canceled, :reversed, :refunded

    def done
      yield if params[:status_pagamento].eql?('4')
    end

    def canceled
      yield if params[:status_pagamento].eql?('5')
    end

    def reversed
      yield if params[:status_pagamento].eql?('7')
    end

    def refunded
      yield if params[:status_pagamento].eql?('9')
    end
  end
end
