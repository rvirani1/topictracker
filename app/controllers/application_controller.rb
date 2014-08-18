class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => [:index]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :current_password)}
  end
end
