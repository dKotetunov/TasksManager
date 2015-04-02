class Role < ActiveRecord::Base
  has_many :users
  attr_accessible :name
  ADMIN = 'admin'
  MODERATOR = 'moderator'
  USER = 'user'

  def self.admin
    find_by_name(ADMIN)
  end

  def self.moderator
    find_by_name(MODERATOR)
  end
end