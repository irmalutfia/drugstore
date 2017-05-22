class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale
  before_action :configure_sign_up_permitted_parameters, if: :devise_controller?
  before_action :configure_update_permitted_parameters, if: :devise_controller?

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def configure_sign_up_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :username, :fullname)
    end
  end

  def configure_update_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password, :username, :fullname)
    end
  end

end
