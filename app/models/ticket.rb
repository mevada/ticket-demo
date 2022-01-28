# WillPaginate.per_page = 3 	
class Ticket < ApplicationRecord
  include Abc::Ticketable
	validates :title , presence:true
	validates :description, presence:true ,length: {minimum: 10}
	belongs_to :category
	belongs_to :user
	
	
  scope :arc, ->{where(status: 'archive')}
  	#self.per_page = 3
  	#scope :pub, where(status: 'public')

  	has_many_attached :images
  	searchkick word_start: [:title]
  	def search_data
  		{
  			title: title
  		}
  	end	

    def name_1
      name_info2
    end

    protected
    def name_info
      p "Hello, I'm ruby"
    end

    private
    def name_info2
      p "Hello, I'm rails"
    end
end
