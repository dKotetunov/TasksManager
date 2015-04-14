class ProfilesController < ApplicationController
<<<<<<< HEAD
  before_action :set_profile, only :show
=======
  before_action :set_profile, only: :show
>>>>>>> d94a95a0e9589c25e46e31431cb13e6cc0b10ee2

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
