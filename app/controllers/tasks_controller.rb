class TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = Task.for_project(@project.id)
    @tasks_done = @tasks.done
    @tasks_started = @tasks.started
    @tasks_not_started = @tasks.not_started
  end

  def new
    @task = Task.new
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  def create
    @task = @project.task.create(params[:task])
    redirect_to projects_tasks_path
  end

  def destroy
    @task = @project.task.find(params[:id])
    @task.destroy
    redirect_to projects_tasks_path
  end

  private
   def set_project
     @project = Project.find(params[:project_id])
   end
end
