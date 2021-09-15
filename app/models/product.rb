class Product < ApplicationRecord
	has_many :pictures, :as => :imageable

	accepts_nested_attributes_for :pictures

	belongs_to :user
end
