class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: Account for params missing
    @projects = Project.near(project_params[:address], 30).where({category: project_params[:category]})
    .joins(:roles).where(roles: {title: params[:project][:roles][:title].titleize})
    # Category can never be nil TODO: make sure it's preselected on home
    @category = @projects.first.category unless @projects.empty?
    @subcategories = @projects.map { |p| p.subcategory }.uniq
    # Array of subcategories names for yielded projects
  end

  def show
    @project_coordinates = { lat: @project.latitude, lng: @project.longitude }
    @available_roles = @project.roles.select { |role| role.status }
    @team = []
    @project.roles.each do |role|
      role.requests.each do |request|
        @team << request.user if request.user_confirm && request.owner_confirm
      end
    end
  end

  def new
    @project = current_user.projects.new
    authorize @project
    150.times do
      @project.roles.new
    end
  end

  def create
    @project = Project.new(project_params)
    @project.picture = "film.jpg"  if project_params[:picture].nil?
    @project.user = current_user
    @project.subcategory = params["subcategory#{@project.category}"]
    authorize @project
    if @project.save!
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.js do
      end
      format.html do
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :full_description, :category, :subcategory,
                                    :short_description, :user_id, :picture, :address, :total_budget,
                                    :roles_attributes => [:title, :description, :compensation, :requirements])
  end
end
