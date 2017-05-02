class Request < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :user_confirm, presence: true
  validates :owner_confirm, presence: true
  validates :owner_message, presence: true
  validates :user_message, presence: true

end
