class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  autocomplete :role, :title
  def home
    @project = Project.new
    @projects = Project.all.sample(3)
    @role = Role.new
    @all_roles = Role.all
  end
end
