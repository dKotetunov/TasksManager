class TasksController < ApplicationController
  load_and_authorize_resource

  before_action :set_project
  before_action :set_task, only: [:start, :finish, :destroy, :edit, :update, :show]
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
    @tasks = Task.for_project(@project.id)
    @tasks_not_started = @tasks.not_started
    @task = @project.tasks.create(params[:task])
      respond_to do |format|
        if @task
          format.json { head :no_content }
          format.js
        else
          render 'new'
        end
      end
  end

 def show
   @comment = Comment.new(task_id: @task.id)
   @comments = Comment.for_task(@task.id)
 end

 def start
   authorize! :start, @task
   @task.start!
   redirect_to project_tasks_path
 end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to projects_tasks_path }
      format.json { head :no_content }
    end
  end

  def finish
    authorize! :finish, @task
    @task.finish!
    redirect_to project_tasks_path
  end

  def update
    @tasks = Task.for_project(@project.id)
    @tasks_not_started = @tasks.not_started
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.json { head :no_content }
        format.js
      else
        render 'edit'
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
    authorize! :read, @project
  end

  def set_task
    @task = @project.tasks.find(params[:task_id] || params[:id])
  end

end
