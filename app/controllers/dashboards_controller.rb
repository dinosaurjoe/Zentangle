class DashboardsController < ApplicationController
  def show
    @user = current_user
    @projects = @user.projects

    @incoming_invites = @user.requests.select { |request| request.created_by != @user }

    @outgoing_requests = @user.requests.select { |request| request.created_by == @user }

    @outgoing_invites = []

    @incoming_requests = []

    outgoing_invites_and_incoming_requests

  end

  private

  def outgoing_invites_and_incoming_requests
    @projects.each do |project|
      project.requests.each do |request|
        @outgoing_invites << request if request.created_by == @user
        @incoming_requests << request if request.created_by != @user
      end
    end
  end

  def request_status(request)
    if request.user_confirm && request.owner_confirm
      return "joined"
    elsif request.user_confirm.nil? || request.owner_confirm.nil?
      return "pending"
    elsif !request.user_confirm || !request.owner_confirm
      return "declined"
  end
end


# -------------------------
# request {
#   outgoing: "you've invited #{@request.user.id}"
#   incoming: "you've been invited by #{created_by}"
# }

# if created_by == current_user -> outgoing
# else incoming -> @request.user.id
