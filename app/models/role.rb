class Role < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :requirements, presence: true
  validates :description, presence: true
end
