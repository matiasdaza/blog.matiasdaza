class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categoires

  protected

  def configure_permitted_parameters
      #Forma para Rails 5, antes se usaba for en vez de permit
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password])
  end

  #Como todos los controladores heredan de ApplicationController, podemos compartir aquí a categories
  def set_categoires
    @categories = Category.all
  end

end
