class  UsersController < Devise::RegistrationsController
  #prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :require_no_authentication, only: [:cancel ]
 
  #prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
      @items = Item.all
      super
  end
 #for signup failure
  def create
      build_resource(sign_up_params)

   if resource.save
        yield resource if block_given?
        if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
        else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
    else
        clean_up_passwords resource
        resource.errors.full_messages.each {|x| flash[x] = x} 
        redirect_to root_path 
    end

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
      super
   end
   
  def profile
  #commented @profilepic = Profilepic.find(params[:id])
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
 
  end
 
end
