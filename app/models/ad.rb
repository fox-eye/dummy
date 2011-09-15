class Ad < ActiveRecord::Base
  belongs_to :category
  has_attached_file :photo, :styles => { :medium => "450>x200>", :thumb => "90x90#" }
  
  attr_accessible :title, :description, :photo
  
  validates :title, :presence => true
  
  validates_attachment_size :photo, :less_than => 4.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg']
end
