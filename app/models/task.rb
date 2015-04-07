class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :name, :description, :status, :project_id
  DONE = 'done'
  STARTED = 'started'
  NOT_STARTED = 'not_started'

  scope :for_project, ->(project_id) { where(:project_id => project_id)}
  scope :done, -> {where(:status => 'done')}
  scope :started, ->{where(:status =>'started')}
  scope :not_started, ->{where(:status =>'not_started')}

end
