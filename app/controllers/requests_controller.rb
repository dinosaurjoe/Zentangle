class RequestsController < ApplicationController
  before_action :set_project, only: [:create]
  def index
    @request = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new()
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.project = @project
    if @request.save
      redirect_to dashboard_path
    else
      redirect_to new_project_booking_path
      # path unclear
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.detroy
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def request_params
    params.require(:request).permit(:user_id, :role_id)
  end
end
