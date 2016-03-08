class  UsersController < Devise::RegistrationsController
#prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
prepend_before_filter :require_no_authentication, only: [:cancel ]

#prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
protected

  def after_sign_up_path_for(resource)
  
    '/items/new' # Or :prefix_to_your_route
    
  end

   

  def after_inactive_sign_up_path_for(resource)
 
    '/items/new' # Or :prefix_to_your_route
    
  end
  
  
 
    
end
