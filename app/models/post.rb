class Post < ApplicationRecord

	belongs_to :topic
	belongs_to :user, optional: true
  	has_many :reports


	def self.search(search)
	  where("body LIKE :q OR title LIKE :q OR address LIKE :q OR street LIKE :q OR landlord LIKE :q", q: "%#{search}%")
	end
	
end
