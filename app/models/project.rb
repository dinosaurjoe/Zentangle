class Project < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user
  has_many :roles
  validates :title, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :short_description, presence: true
  mount_uploader :picture, PhotoUploader

# check validations
end
