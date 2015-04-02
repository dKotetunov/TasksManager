class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :name, :description
end
