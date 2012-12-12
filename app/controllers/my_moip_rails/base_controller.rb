module MyMoipRails
  class BaseController < ApplicationController
    helper_method :done

    def done
      yield if params[:status_pagamento] == '4'
    end
  end
end
