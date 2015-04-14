class ProfilesController < ApplicationController
  before_action :set_profile, only: :show

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
