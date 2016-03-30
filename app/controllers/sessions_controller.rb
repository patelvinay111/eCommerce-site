class  SessionsController < Devise::SessionsController
def new
  super
end
def create
    
    auth_options = { :recall => 'users#new', :scope => :user }
    resource = warden.authenticate!(auth_options)
    super
  end

end
