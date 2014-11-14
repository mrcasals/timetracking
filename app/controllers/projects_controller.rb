class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects.last_created_projects(10)
    render 'no_projects' if @projects.empty?
  end

  def show
    @project = current_user.projects.find_by id: params[:id]
    render 'no_project_found' unless @project
  end
end
