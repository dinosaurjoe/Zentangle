class Project < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user
  has_many :roles
  validates :title, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :short_description, presence: true
# check validations

  class << self
    # Project.categories
    def categories
      ["Film", "Music", "Dance", "Design"]
    end

  end
end
