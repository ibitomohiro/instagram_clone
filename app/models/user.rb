class User < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  before_validation { email.downcase! }
  has_secure_password
  validates :image, presence: true 
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  validates :name,  presence: true,
                                    length: { maximum: 30 }
  validates :email, presence: true, 
                                    length: { maximum: 255 },
                                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                                    uniqueness: {case_sensitive: false}                                    
                          
end
