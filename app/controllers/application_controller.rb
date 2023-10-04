class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :photo, :bio, :password, :current_password)}
  end

  def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
  end
end
