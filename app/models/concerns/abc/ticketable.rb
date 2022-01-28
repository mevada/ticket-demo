module Abc
	module Ticketable
	  extend ActiveSupport::Concern
	  included do
	  	scope :pub, ->{where(status: 'public')}
	  	scope :pri, ->{where(status: 'private')}
	  end
	  
	  def private_call
      	display_ticket2
      end
	  def protected_call
      	display_ticket
      end
      

	  protected

	  	def display_ticket
	  		p "protected....."
	  	end

	  private
	  	def display_ticket2
	  		p "private....."
	  	end

  	end	
end	