class Piece < ApplicationRecord
  belongs_to :user
  mount_uploader :cloudinary_path, PhotoUploader
end
