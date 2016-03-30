class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
   
  before_filter :configure_permitted_parameters, if: :devise_controller?

  
  
  
    def configure_permitted_parameters   

    devise_parameter_sanitizer.for(:sign_up) do |user_params|
    user_params.permit(:firstname, :lastname, :email, :password, :password_confirmation )
    end
    devise_parameter_sanitizer.for(:sign_in) do |u| 
    u.permit(:login, :email, :password) 

    end

  end
  
   def after_sign_in_path_for(resource)
   users_dashboard_path
   end
    
 
end

