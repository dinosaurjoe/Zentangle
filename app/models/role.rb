class Role < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    attribute :title
    attributeForDistinct "title"
  end

  include PgSearch
  pg_search_scope :search_by_role,
                  against: [ :title ]

  belongs_to :project
  has_many :requests
  validates :title, presence: true
  validates :requirements, presence: true
  validates :description, presence: true
  validates :compensation, presence: true
  validates_associated :project
end
