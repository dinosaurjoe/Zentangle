class DashboardsController < ApplicationController
  def show
    @user = current_user
    @projects = @user.projects
    @requests = @user.requests
  end
end


# -------------------------
# request {
#   outgoing: "you've invited #{@request.user.id}"
#   incoming: "you've been invited by #{created_by}"
# }

# if created_by == current_user -> outgoing
# else incoming -> @request.user.id
