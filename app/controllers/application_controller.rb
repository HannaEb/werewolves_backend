class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken



    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :bio])
    end


    # before_filter :add_allow_credentials_headers
    # skip_before_filter :verify_authenticity_token
    # before_filter :cors_preflight_check
    # after_filter :cors_set_access_control_headers
    #
    # def cors_set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = '*'
    #   headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    #   headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    #   headers['Access-Control-Max-Age'] = '1728000'
    # end
    #
    # def cors_preflight_check
    #   if request.method == 'OPTIONS'
    #     headers['Access-Control-Allow-Origin'] = '*'
    #     headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    #     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    #     headers['Access-Control-Max-Age'] = '1728000'
    #
    #     render :text => '', :content_type => 'text/plain'
    #   end
    # end
    #
    # def add_allow_credentials_headers
    #   # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5
    #   #
    #   # Because we want our front-end to send cookies to allow the API to be authenticated
    #   # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so
    #   # the browser will not reject the response
    #   response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    #   response.headers['Access-Control-Allow-Credentials'] = 'true'
    # end
end
