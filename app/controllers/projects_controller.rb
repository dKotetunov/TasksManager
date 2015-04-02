class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @moderator = User.new(email: params[:moderator_email], password: params[:moderator_password], role: Role.moderator)

    if @project.save

      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

end
