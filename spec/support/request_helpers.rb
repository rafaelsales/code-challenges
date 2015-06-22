module Requests
  module JsonHelpers
    def json_response
      JSON.parse(response.body)
    end

    def http_auth_header(user)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.password)
      { 'HTTP_AUTHORIZATION' => credentials }
    end
  end
end
