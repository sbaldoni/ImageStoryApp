class Story < ActiveRecord::Base

	has_many :beats, :dependent => :destroy
	accepts_nested_attributes_for :beats

	validates :title, :body, presence: true
	
end
