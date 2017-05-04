class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = Project.all

    if project_params[:category]
      @category = project_params[:category]
      @projects = @projects.where({ category: @category })
    end
    if project_params[:subcategory]
      @subcategory = project_params[:subcategory]
      @projects = @projects.where({ subcategory: @subcategory })
    end

    @subcategories = Project::CATEGORIES[@category.to_sym]
  end

  def show
    @project = Project.find(params[:id])
    @available_roles = @project.roles.select { |role| role.status }
    @team = []
    @project.roles.each do |role|
      role.requests.each do |request|
        @team << request.user if request.user_confirm && request.owner_confirm
      end
    end
    p @team
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.picture = "film.jpg"  if project_params[:picture].nil?
    @project.user = current_user
    if @project.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :full_description, :category, :subcategory,
                                    :short_description, :user_id)
  end
end
