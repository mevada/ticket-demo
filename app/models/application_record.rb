class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #scope :pub, ->{where(status: 'public')}
  #scope :pr, ->{where(status: 'private')}
  #scope :ar, ->{where(status: 'archive')}
  
  
end
