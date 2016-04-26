# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  gender     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  avatar     :string(255)
#

class ProfilesController < ApplicationController

  before_action :set_profile, only: :show

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
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

