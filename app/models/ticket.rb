# WillPaginate.per_page = 3 	
class Ticket < ApplicationRecord
	validates :title , presence:true
	validates :description, presence:true ,length: {minimum: 10}
	belongs_to :category
	belongs_to :user
	
	scope :pub, ->{where(status: 'public')}
	scope :pri, ->{where(status: 'private')}
  	scope :arc, ->{where(status: 'archive')}
  	#self.per_page = 3
  	#scope :pub, where(status: 'public')

  	has_many_attached :images
end
