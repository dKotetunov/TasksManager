class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :set_user

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
  end


  private
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
