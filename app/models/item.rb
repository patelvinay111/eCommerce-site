class Item < ActiveRecord::Base
has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" },
 :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
      
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
belongs_to :user
end
