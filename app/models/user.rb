class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates_format_of :email, :with =>  Devise::email_regexp
 
  
  attr_accessor :login

 # has_one :paperclip, dependent: :destroy

   has_attached_file :paperclip, styles: { small: "64x64", med: "100x100", large: "200x200" },

     :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

validates_attachment_content_type :paperclip, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



 
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



