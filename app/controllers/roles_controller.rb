class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:role_id])
  end

  def new
    @role = Role.new
    @project = Project.find(params[:id])

    @role.project = @project
  end

  def create
    @role = Role.new(role_params)
    @project = Project.find(params[:role_id])
    @role.project = @project
    p @role
    if @role.save
      redirect_to @role
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
    @role.update(boat.params)
    redirect_to @role
  end

  private
  def role_params
    params.require(:role).permit(:project_id, :requirements, :title)

  end
end
