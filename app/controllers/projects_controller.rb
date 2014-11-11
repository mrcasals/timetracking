class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
  end
end
