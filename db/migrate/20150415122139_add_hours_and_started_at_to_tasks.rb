class AddHoursAndStartedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :hours, :integer
    add_column :tasks, :started_at, :datetime
  end
end
