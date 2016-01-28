class ModeratorsController < ApplicationController
  before_action :set_moderator, except: [:index, :new, :create]
  def index
    @moderator = User.moderator
  end

  def new
    @moderator = User.new
    @moderator.build_profile
  end

  def create
    @moderator = User.new(params[:user].merge(role: Role.moderator))
    @moderator.skip_confirmation!
    if @moderator.save
      redirect_to moderators_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @moderator.update_attributes(params[:user])
      redirect_to moderators_path
    else
      render 'edit'
    end
  end

  def destroy
    @moderator.destroy
    redirect_to moderators_path
  end

  private

  def set_moderator
    @moderator = User.find(params[:id])
  end
end