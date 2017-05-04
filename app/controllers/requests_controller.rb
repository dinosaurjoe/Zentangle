class RequestsController < ApplicationController
  before_action :set_role, only: [:create]
  def index
    @request = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @role = @request.role
  end

  def new
    @request = Request.new
    @role = Role.find(params[:role_id])
    @request.role = @role
    @request.user_confirm = true
    @request.created_by = current_user
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    p @request.save
    if @request.save
      redirect_to dashboard_path
    else
      redirect_to new_role_request(@request.role)
      # path unclear
    end
  end

  def decline
    if current_user == @request.project.owner
      @request.owner_confirm == false
    else
      @request.user_confirm == false
    end

  end

  def destroy
    @request = Request.find(params[:id])
    @request.detroy
  end

  private

  def set_role
    @role = Role.find(params[:role_id])
  end

  def request_params
    params.require(:request).permit(:created_by, :role_id, :project_id)
  end
end
