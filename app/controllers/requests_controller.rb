class RequestsController < ApplicationController
  before_action :set_role, only: []
  before_action :set_request, only: [:show, :edit, :update, :destroy, :accept]
  skip_after_action :verify_authorized
  def index
    authorize @request
    @request = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @role = @request.role
    @request.status(current_user)
  end

  def new
    @request = Request.new
    @role = Role.find(params[:role_id])
    @request.role = @role
    @request.user_confirm = true
    @request.created_by = current_user
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.created_by = current_user
    @request.user = current_user
    authorize @request
    @request.save
    if @request.save!
      redirect_to dashboard_path
    else
      redirect_to new_role_request_path(@request.role)
      # path unclear
    end
  end

  def decline
    authorize @request
    if current_user == @request.project.owner
      @request.owner_confirm == false
      Pusher.trigger("user-#{@request.user.id}-#{Rails.env}", 'status', {
        message: "Your request to join #{@request.role.project.title} was declined :("
    })
    else
      @request.user_confirm == false
      Pusher.trigger("user-#{@request.user.id}-#{Rails.env}", 'status', {
        message: "Your request to join #{@request.role.project.title} was declined :("
      })
    end

  end

  def accept
    Pusher.trigger("user-#{@user.id}-#{Rails.env}", 'status', {
      message: "accept"
    })
    authorize @request

    @request.user_confirm = true
    @request.owner_confirm = true
    @request.save

    #"#{@request.role.project.owner.first_name} accepted your request to join #{@request.role.project.title}"
    redirect_to dashboard_path
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
  end

  def update
    @request = Request.find(params[:id])
    params[:commit] =="accept" ? @request.owner_confirm = true : @request.owner_confirm = false
    @request.destroy if params[:commit] == "decline"
    redirect_to dashboard_path
  end

  private

  def set_role
    @role = Role.find(params[:role_id])
  end

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:user_confirm, :owner_confirm, :user_message, :owner_message, :created_by, :role_id, :project_id)
  end
end
