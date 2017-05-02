class Project < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user
  has_many :requests
  has_many :roles
  validates :name, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :short_description, presence: true
# check validations
end
