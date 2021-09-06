class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :tickets
  has_many :blogs

  has_many :products
  has_many :employees
  
  
  #validates_with AttachmentPresenceValidator, attributes: :avatar
  #validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates :avatar,  presence:true

  #has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  has_one_attached :avatar   

end
