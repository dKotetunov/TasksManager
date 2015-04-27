class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = @task.comments.create(params[:comment])
    redirect_to project_task_path(@comment.project, @comment.task, @comment)
  end

  def destroy
    @comment = @comments.find(params[:id])
    @comment.destroy
    redirect_to
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
