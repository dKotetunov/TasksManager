class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :user_id

  belongs_to :user

  DEFAULT_PROFILE = 'first name','last name'

  def self.default_profile
    find_by_first_name(DEFAULT_PROFILE)
  end
end
