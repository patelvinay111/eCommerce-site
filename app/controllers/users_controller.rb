class  UsersController < Devise::RegistrationsController
#prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
prepend_before_filter :require_no_authentication, only: [:cancel ]
 

#prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
      @items = Item.all
      super
  end
  
  def dashboard
      #@user = User.find(params[:id])
   @user = User.new 
  end 
 
protected

  def after_sign_up_path_for(resource)
  users_dashboard_path
  end

   

  def after_inactive_sign_up_path_for(resource)
 
  users_dashboard_path
  end

  def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :paperclip)
    end
  
end
