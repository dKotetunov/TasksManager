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
    update_attributes(status: STARTED,started_at: Time.now)
  end

  def finish!
    update_attribute(:status, DONE)
  end

  def progress
    done_hours = (((Time.now - started_at)/1.day - 1).to_i)*8
    if started_at.hour < 17 && started_at.hour > 9
      done_hours += 17 - started_at.hour
    end
    if Time.now.hour < 17 && Time.now.hour > 9
      done_hours += Time.now.hour - 9
    end
    done_progress = (done_hours * 100 / hours).round
    done_progress < 100 ? 100 : done_progress
  end

  private

  def set_default_status
    self.status = NOT_STARTED
  end
end
