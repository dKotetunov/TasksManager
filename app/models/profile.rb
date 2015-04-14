class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :user_id

  belongs_to :user

end
