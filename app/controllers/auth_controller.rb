class AuthController < ApplicationController
    include AuthHelper

    def get_token
      token = get_token_from_code params[:code]
      session[:access_token] = token.token
      puts session[:access_token]
    end
end
