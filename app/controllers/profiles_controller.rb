class ProfilesController < ApplicationController

  before_action :set_profile, only: :show

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile = current_user.profile
      @profile.update_attributes(params[:profile])
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
