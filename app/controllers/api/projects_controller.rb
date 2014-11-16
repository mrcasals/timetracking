class Api::ProjectsController < ApplicationController
  # This skips the token authentication validation, so we can use curl or other
  # commands to POST data to our app.
  skip_before_action :verify_authenticity_token

  def index
    @projects = Project.all.includes(:entries)
  end

  def create
    @project = Project.create(project_params)
    render 'show'
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  # This would need to permit user, group, etc.
  # This has been simplified for demo purposes.
  def project_params
    params.require(:project).permit(:name)
  end
end
