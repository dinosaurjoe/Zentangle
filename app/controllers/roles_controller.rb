class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
    @project = Project.find(params[:id])
    @role.project = @project
  end

  def create
    @role = Role.new(role_params)
    @project = Project.find(params[:id])
    @role.project = @project

    if @role.save
      render :new
    else
      redirect_to new_role_path
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    @role.update(role.params)
  end

  private
  def role_params
    params.require(:role).permit(:project_id, :requirements, :title)

  end
end
