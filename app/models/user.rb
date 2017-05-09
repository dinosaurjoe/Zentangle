class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_picture, PhotoUploader
  has_many :request_collaborator, :class_name => 'Request', :foreign_key => 'user_id'
  has_many :created_requests, :class_name => 'Request', :foreign_key => 'created_by_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pieces
  accepts_nested_attributes_for :pieces

  has_many :projects
  has_many :requests, through: :projects
  validates :email, uniqueness: true

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy
  # TODO
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def outgoing_invites
    self.created_requests.select { |request| request.user != self}
  end

  def outgoing_requests
    self.created_requests.select { |request| request.user == self}
  end

  def incoming_invites
    self.request_collaborator.select { |request| request.created_by != self }
  end

  def incoming_requests
    self.requests.select { |request| request.created_by != self }
  end

end
