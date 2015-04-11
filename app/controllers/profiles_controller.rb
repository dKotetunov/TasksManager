class ProfilesController < ApplicationController
  before_action :set_user
  def show
    @profile = @user.profile
  end

  def edit
    @profile = @user.profile
  end
  def update
    @profile = @user.profile
    @profile.update_attributes(params[:profile])
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
