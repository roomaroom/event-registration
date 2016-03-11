class ApplicationController < ActionController::Base
  include TheComments::ViewToken
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
    devise_parameter_sanitizer.for(:sign_up) << :name << :mobile << :city << :community << :email << :sex << :birthday
    devise_parameter_sanitizer.for(:sign_in) << :login << :password << :email << :sex << :birthday
    devise_parameter_sanitizer.for(:account_update) << :name << :mobile << :city << :community << :email << :sex << :birthday
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :mobile, :email, :password, :password_confirmation, :city, :community) }
  #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :mobile, :email, :password, :password_confirmation, :city, :community, :remember_me) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :mobile, :email, :city, :community, :password, :password_confirmation, :current_password) }
  # end
end
