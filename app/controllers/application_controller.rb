class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_pic, :first_name, :last_name,:date_of_birth, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_pic, :first_name, :last_name,:date_of_birth, :gender])
  end

  def user_admin?
    user_signed_in? && current_user.admin?
  end

  def check_user
    return redirect_to root_url, alert: "Must be logged in as Admin" unless user_admin?
  end

end
