# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  task_id    :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :task_id, :text, :user_id

  belongs_to :user
  belongs_to :task

  delegate :project, to: :task

  scope :for_task, ->(task_id) { where(task_id: task_id) }
end
