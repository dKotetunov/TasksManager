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

class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :user_id, :avatar
  validates :first_name, :last_name, presence: true
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  def fullname
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end
end
