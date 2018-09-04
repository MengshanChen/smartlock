module AuthHelper
  CLIENT_ID = '0221ea6b-71da-47d0-bc54-0ec2d2b70c02' 
  CLIENT_SECRET = 'd2edef94-8539-43bb-9a0f-8ed2e3374bf7'
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

end
