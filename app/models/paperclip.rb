class Paperclip < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
belongs_to :user

 
    #validates_confirmation_of :password
  #validates_confirmation_of    :password, :on=>:create

 has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" },

     :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


   
end



