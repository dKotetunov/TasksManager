class ModeratorsController < ApplicationController

  def index
    @moderator = User.moderator
  end

  def new
    @moderator = User.new
    @moderator.build_profile
  end

  def create
    @moderator = User.new(params[:user].merge(role: Role.moderator))
    if @moderator.save
      redirect_to moderators_path
    else
      render 'new'
    end
  end

  def edit
    @moderator = User.find(params[:id])
  end

  def update
    @moderator = User.find(params[:id])
    if @moderator.update_attributes(params[:user])
      redirect_to moderators_path
    else
      render 'edit'
    end
  end

  def destroy
    @moderator = User.find(params[:id])
    @moderator.destroy
    redirect_to moderators_path
  end
end