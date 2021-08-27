class Category < ApplicationRecord
	validates :name ,uniqueness: true ,presence: true  
	#validates :name, presence: { strict: true }
	#validates :name ,uniqueness: true, on: :create
	 #validates :name ,uniqueness:{ message: "%{value} seems wrong" }
	# validates :name, presence: true, if: :paid_with_card?
	#validates :name, confirmation: { message: "--------confirm"}
	 def paid_with_card?
    	puts "----card--------"
  	end
  	has_many :tickets
end
