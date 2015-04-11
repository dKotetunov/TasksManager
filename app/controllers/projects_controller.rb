class ProjectsController < ApplicationController
  load_and_authorize_resource

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
    @moderator = User.new(email: params[:project][:moderator_email], password: params[:project][:moderator_password], role: Role.moderator)
    @project = Project.new(params[:project])

    if @project.valid? && @moderator.valid?
      @moderator.skip_confirmation!
      @moderator.save
      @project.user = @moderator
      @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to projects_path
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

