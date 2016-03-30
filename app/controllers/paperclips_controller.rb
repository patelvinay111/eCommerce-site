class Users::PaperclipsController < ActionController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
     def new
  @paperclip  = Paperclip.new
  end
  def edit
      @paperclip = Paperclip.create(params[:photo])
    end


  
 
  
  def create
  @paperclip = Paperclip.create( paperclip_params )
end
 def show
    @paperclip = Paperclip.find(params[:id])
  end


  
private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.
 def paperclip_params
params.require(:paperclip).permit(:paperclip)
    end

#def paperclip_params
 # params.require(:paperclip).permit(:paperclip)
#end
  
  
end

