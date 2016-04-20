class ProfilepicsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
     def new
  #super
   @profilepic = Profilepic.new
       
#@profilepic = @user.profilepic.new
  end
  def edit
      
  end


  def index
     @profilepic = Profilepic.find(params[:id])
 
  end
  
  def create 
      # @profilepic = @user.profilepic.create
    @profilepic = Profilepic.create( profilepic_params )
      #  @profilepic= @user.profilepic.new

    @profilepic.user = current_user
	
	#Profilepic.create(user_id: current_user.id)


  redirect_to @profilepic   
  end
  
 def show
    @profilepic = Profilepic.find(params[:id])
  end

def profilepic
    @profilepic = Profilepic.find(params[:id])
  end


  def profilepic_params
      params.require(:profilepic).permit(:avator)
    end
end

