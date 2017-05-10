class Request < ApplicationRecord
  attr_reader :message
  belongs_to :created_by, :class_name => "User"
  belongs_to :user, :class_name => "User"
  # belongs_to :user
  belongs_to :role

  # validates :user_confirm, presence: true #nil is pending, false is declined
  # validates :owner_confirm, presence: true #nil is pending, false is declined
  # validates :owner_message, presence: true
  # validates :user_message, presence: true
  validates :created_by, presence: true



  def status(current_user)
    @request = self
    @role = @request.role
    if @role.project.owner == current_user
      owner_status_logic
    elsif @request.user == current_user
      user_status_logic
    end
  end

  private

  def owner_status_logic
    if @request.created_by == @request.role.project.owner
      # you invited user
      if @request.user_confirm
        @message = "#{@request.user.full_name} joined #{@role.project.title}!"
      elsif @request.user_confirm == false
        @message = "#{@request.user.full_name} declined your request to join #{@role.project.title}"
      else
        @message = "You requested #{@request.user.full_name} to join #{@role.project.title}"
      end
    else
      # user requested to join your project
      @message = "#{@request.user.full_name} requested to join #{@role.project.title}!"
      @message = "You declined #{@request.user.full_name}'s request to join #{@role.project.title}" if @request.owner_confirm == false
    end
  end

  def user_status_logic
    if @request.created_by == @request.user
      # you requested to join owner's project
      @message = "You requested to join"
      @message = "#{@role.project.owner.full_name} declined your request to join #{@role.project.title}" if @request.owner_confirm == false

    else
      # owner invited you to join their project
      if @request.user_confirm
        @message = "You joined #{@role.project}!"
      elsif @request.user_confirm == false
        "#You declined {@role.owner.full_name}'s request for you to join #{@role.project.title}!"
      else
        @message = "#{@role.owner.full_name} requested you to join #{@role.project.title}!"
      end
    end
  end

end
