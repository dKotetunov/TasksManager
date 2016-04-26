# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  task_id    :integer
#

class CommentsController < ApplicationController
  load_and_authorize_resource

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

