class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permited_parameters, if: :devise_controller?

  protected

  # define page to load on successful sign-in
  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permited_parameters
    added_attrs = [:username, :image, :email, :password, :password_confirmation, :remember_me, :native_language, :language_of_study]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
