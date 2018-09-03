require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SmartThings < OmniAuth::Strategies::OAuth2
      option :name, 'smartthings'
      option :client_options, {
        :site => 'https://graph.api.smartthings.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token',
        :scope => 'app'
      }

      def request_phase
        redirect client.auth_code.authorize_url(redirect_uri: 'http://localhost:4567/oauth/callback', scope: 'app')
      end

      def callback_phase
        puts 'aight dawgggg'
      end

      def build_access_token
        verifier = params[:code]
        puts 'Code is: ' + verifier
        response = client.auth_code.get_token(verifier, redirect_uri: 'http://localhost:4567/oauth/callback', scope: 'app')
        session[:access_token] = response.token
        puts 'Token is: ' + session[:access_token]
        return session[:access_token]
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super(), {
          'provider' => 'smartthings',
          'uid' => 'Seattle University',
        })
      end
    end
  end
end
OmniAuth.config.add_camelization 'smartthings', 'SmartThings'
