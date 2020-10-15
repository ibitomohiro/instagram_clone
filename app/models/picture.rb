class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence:true
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
