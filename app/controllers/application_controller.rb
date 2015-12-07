class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :mobile << :city << :community << :email
    devise_parameter_sanitizer.for(:sign_in) << :login << :password << :email
    devise_parameter_sanitizer.for(:account_update) << :name << :mobile << :city << :community
  end
end
