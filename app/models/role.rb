class Role < ActiveRecord::Base
  has_many :users
  attr_accessible :name
  ADMIN = 'admin'.freeze
  MODERATOR = 'moderator'.freeze
  USER = 'user'.freeze

  def self.admin
    find_by_name(ADMIN)
  end

  def self.moderator
    find_by_name(MODERATOR)
  end

  def self.user
    find_by_name(USER)
  end

  def admin?
    name == ADMIN
  end

  def moderator?
    name == MODERATOR
  end

  def simple_user?
    name == USER
  end
end