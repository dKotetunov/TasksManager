class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
      @projects = Project.search(params[:search]).order("name").page(params[:page]).per(5)
    else
      @projects = Project.all.order('created_at DESC')
      @projects = Project.order('name').page(params[:page]).per(5)
    end
  end

  def new
    @project = Project.new
  end

  def show
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
    if @project.valid?
      @project.save
      format.json { head :no_content }
      format.js
    else
      render 'new'
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
      format.json { head :no_content }
      format.js
      else
      render 'edit'
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to projects_path }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end

