class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User

  before_action :configure_permitted_parameters, if: :devise_controller?

  has_one :profile

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :bio])
  end

end
