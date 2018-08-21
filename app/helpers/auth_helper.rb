module AuthHelper
    CLIENT_ID = '7022b5c7-5b9c-422e-a4ac-79a0fc520b3c' 
    CLIENT_SECRET = 'bbaa97fe-0de8-47a7-85ee-33d3acd45087'
    REDIRECT_URI = 'http://localhost:4567/oauth/callback'
  
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
end
