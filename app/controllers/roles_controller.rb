class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
    @project = Project.find(params[:id])
    @role.project = @project
    authorize @role
  end

  def create
    @role = Role.new(role_params)
    @project = Project.find(params[:id])
    @role.project = @project
    authorize @role
    if @role.save
      render :new
    else
      redirect_to new_role_path
    end
  end

  def destroy
    @role.destroy
  end

  def edit
  end

  def update
    @role.update(role.params)
  end

  private

  def set_role
    @role = Role.find(params[:id])
    authorize @role
  end

  def role_params
    params.require(:role).permit(:project_id, :requirements, :title)

  end
end
