module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :mobile << :city << :community << :sex << :birthday
    devise_parameter_sanitizer.for(:account_update) << :name << :mobile << :city << :community << :sex << :birthday
  end

end

DeviseController.send :include, DevisePermittedParameters
