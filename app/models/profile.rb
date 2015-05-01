class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :user_id
  validates :first_name, :last_name, presence: true
  belongs_to :user

  def fullname
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end
end
