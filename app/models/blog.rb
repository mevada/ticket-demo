class Blog < ApplicationRecord
	self.abstract_class = true
	connects_to database: { writing: :primary, reading: :primary_replica}
	belongs_to :user

end
