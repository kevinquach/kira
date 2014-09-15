class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    p params
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project,
      notice: "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render "new"
    end
    p params
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
