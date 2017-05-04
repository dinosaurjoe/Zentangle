class Role < ApplicationRecord
  belongs_to :project
  has_many :requests
  validates :title, presence: true
  validates :requirements, presence: true
  validates :description, presence: true
  validates :compensation, presence: true

  validates_associated :project
end
