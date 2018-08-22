module AuthHelper
    CLIENT_ID = '8508670b-6f53-4f2a-a9ba-7d0a16d2237f' 
    CLIENT_SECRET = 'f481de3a-761c-4cda-a1c4-64b68ca98969'
    REDIRECT_URI = 'http://localhost:4567/oauth/callback'
    ENDPOINTS_URI = 'https://graph.api.smartthings.com/api/smartapps/endpoints'
  
    def get_login_url
      client = OAuth2::Client.new(CLIENT_ID,
                                  CLIENT_SECRET,
                                  :site => 'https://graph.api.smartthings.com',
                                  :authorize_url => '/oauth/authorize',
                                  :token_url => '/oauth/token'
                                 )
  
      login_url = client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI, :scope => 'app')
    end
  
    def get_token_from_code(auth_code)
      client = OAuth2::Client.new(CLIENT_ID,
                                  CLIENT_SECRET,
                                  :site => 'https://graph.api.smartthings.com',
                                  :authorize_url => '/oauth/authorize',
                                  :token_url => '/oauth/token'
                                 )
  
      token = client.auth_code.get_token(auth_code,
                                  :redirect_uri => REDIRECT_URI,
                                  :scope => 'app')
    end

    def authenticated?
      session[:access_token]
    end
end
