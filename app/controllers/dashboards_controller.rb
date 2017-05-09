class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @user = current_user
    @projects = @user.projects
  end

  private

  def request_status(request)
    if request.user_confirm && request.owner_confirm
      return "joined"
    elsif request.user_confirm.nil? || request.owner_confirm.nil?
      return "pending"
    elsif !request.user_confirm || !request.owner_confirm
      return "declined"
    end
  end

  helper_method :request_status
end

