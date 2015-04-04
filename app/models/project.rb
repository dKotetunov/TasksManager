class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates_presence_of :name

  attr_accessible :name, :description, :user
end
