class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_admin!
    redirect_to root_path, alert: 'Not authorized.' unless current_user.role == 'admin'
  end

  def authenticate_owner!
    redirect_to root_path, alert: 'Not authorized.' unless current_user.role == 'owner'
  end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[username firstname lastname role])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[username firstname lastname role])
  # end
end
