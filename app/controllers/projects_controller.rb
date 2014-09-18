class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: t('projects.flashes.create.success')
    else
      flash[:alert] = t('projects.flashes.create.error')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: t('projects.flashes.update.success')
    else
      flash[:alert] = t('projects.flashes.update.error')
      render :edit
    end
  end

  def destroy
    @project.destroy

    flash[:notice] = t('projects.flashes.destroy')

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = I18n.t('projects.flashes.missing')
    redirect_to projects_path
  end
end
