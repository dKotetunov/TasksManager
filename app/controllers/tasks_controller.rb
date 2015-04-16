class TasksController < ApplicationController
 load_and_authorize_resource

  before_action :set_project
  before_action :set_task, only: [:start, :finish, :destroy, :edit, :update]

  def index
    @tasks = Task.for_project(@project.id)
    @tasks_done = @tasks.done
    @tasks_started = @tasks.started
    @tasks_not_started = @tasks.not_started
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.create(params[:task])
    redirect_to project_tasks_path
  end

  def start
    authorize! :start, @task
    @task.start!
    @task.update_attribute(:started_at, Time.now.to_datetime)
    redirect_to project_tasks_path
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path
  end

  def finish
    authorize! :finish, @task
    @task.finish!
    redirect_to project_tasks_path
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to project_tasks_path
    else
      render 'edit'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:task_id] || params[:id])
  end

end
