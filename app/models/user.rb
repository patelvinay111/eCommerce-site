class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates_format_of :email, :with =>  Devise::email_regexp
    
    acts_as_messageable
  
  attr_accessor :login, :profilepic

  has_one :profilepic

  #, dependent: :destroy

  def mailboxer_name
  #"User #{id}"
  self.firstname
    end
    #Returning the email address of the model if an email should be sent for this object (Message or Notification).
    #If no mail has to be sent, return nil.
  def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
  self.email
  #return "define_email@on_your.model"
  #if false
  #return nil
  end

 
    #validates_confirmation_of :password
  #validates_confirmation_of    :password, :on=>:create

def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end



