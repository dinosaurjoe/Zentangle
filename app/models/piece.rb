class Piece < ApplicationRecord
  belongs_to :user
  mount_uploader :cloudinary_path, PhotoUploader

  validates :cloudinary_path, presence: true
  # validates :title, presence: true
end
