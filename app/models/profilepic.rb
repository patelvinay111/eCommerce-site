class Profilepic < ActiveRecord::Base

belongs_to :user
#validates :user_id, :presence => true

has_attached_file :avator, styles: { small: "64x64", med: "100x100", large: "200x200" },

     :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

validates_attachment_content_type :avator, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
