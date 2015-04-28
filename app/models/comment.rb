class Comment < ActiveRecord::Base
  attr_accessible :task_id, :text, :user_id

  belongs_to :user
  belongs_to :task

  delegate :project, to: :task

  scope :for_comment, ->(task_id) { where(task_id: task_id) }
end
