class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :name, :description, :status, :project_id, :user_id, :hours, :started_at
  DONE = 'done'
  STARTED = 'started'
  NOT_STARTED = 'not_started'

  before_create :set_default_status

  scope :for_project, ->(project_id) { where(project_id: project_id) }
  scope :done, -> { where(status: DONE) }
  scope :started, -> { where(status: STARTED) }
  scope :not_started, -> { where(status: NOT_STARTED) }

  def start!
    update_attributes(status: STARTED,started_at: Time.now.strftime('%Y-%m-%d %H:%M'))
  end

  def finish!
    @hours = ((updated_at - started_at) / 1.hour).round
    update_attribute(:status, DONE)
  end

  private

  def set_default_status
    self.status = NOT_STARTED
  end
end
