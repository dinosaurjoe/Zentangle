class DashboardsController < ApplicationController
  def show
    @user = current_user
    @projects = @user.projects
    @requests = @user.requests
  end
end
