class Project < ApplicationRecord
  belongs_to :user
  alias_attribute :owner, :user
end
