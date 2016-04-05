class  UsersController < Devise::RegistrationsController
#prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
prepend_before_filter :require_no_authentication, only: [:cancel ]
 

#prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
      @items = Item.all
      @profilepic = Profilepic.new
      super
  end
  
  def editprofile
       @user = User.new   
  end

  def dashboard    
      @user = User.new     
      @profilepic= Profilepic.new
  end 
  
  def edit
      @user = current_user
      #@user = User.find(params[:id])
      #redirect_to(user_dashboard_path)
      super
   end
   
  def profile
  @profilepic = Profilepic.find(params[:id])
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
  def update_resource(resource, params)
      resource.update_without_password(params)
  end
    
  def set_user
   # @user = User.find(params[:id])
  end
 
end
