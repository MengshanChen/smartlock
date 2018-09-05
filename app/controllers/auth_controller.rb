class AuthController < ApplicationController
    include AuthHelper

    def get_token
      token = get_token_from_code params[:code]
      session[:access_token] = token.token
      puts "Token is " + session[:access_token]
      puts "Token expires in: " + token.expires_in.to_s
    end

end
