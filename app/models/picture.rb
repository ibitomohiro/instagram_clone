class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence:true
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
