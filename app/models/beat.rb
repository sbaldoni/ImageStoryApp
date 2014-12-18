class Beat < ActiveRecord::Base
  belongs_to :story
  validates_presence_of :story

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
					  # :url => "/system/beats/pictures/000/000/001/medium/:basename.:extension",
					  # :path => ":public/system/beats/pictures/000/000/001/medium/:basename.:extension"
    validates_attachment :picture, :presence => true, :content_type => { :content_type => "image/jpeg" }
   # validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
