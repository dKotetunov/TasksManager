class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def create
    @project = Project.find(params[:project])
    @task = @project.task.create(params[:task])
    redirect_to projects_tasks_path
  end

  def destroy
    @project = Project.find(params[:project])
    @task = @project.task.find(params[:id])
    @task.destroy
    redirect_to projects_tasks_path
  end
end
