class CommentsController < ApplicationController
  before_action :set_task
  before_action :set_comment, only: [:show, :destroy, :update, :edit]
  def create
    @comment = @task.comments.create(params[:comment].merge(user_id: current_user.id))
    redirect_to project_task_path(@comment.project, @comment.task)
  end

  def destroy
    @comment.destroy
    redirect_to project_task_path(@comment.project, @comment.task)
  end

  def update
    if @comment.update_attributes(params[:comment])
      redirect_to project_task_path(@task.project, @task)
    else
      render 'edit'
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
