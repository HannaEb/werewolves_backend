class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # include ActionController::RequestForgeryProtection
  #
  # skip_before_filter  :verify_authenticity_token
  #
  # protect_from_forgery with: :null_session
  #
  # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :email, :password) }
  #

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :bio, :image])
  end
end


# def create
#   user = User.create sign_up_params
#   user.save
#   render :json => user
# end
#
#
#   private
#
#    def sign_up_params
#      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
#    end
#
#    def account_update_params
#      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :current_password)
#    end
# private
#
#   def sign_up_params
#     params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
#   end
#
#   def account_update_params
#     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
#   end
