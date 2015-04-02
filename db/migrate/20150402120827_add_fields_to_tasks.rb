class AddFieldsToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :project_id
    end
    add_index :tasks, :project_id
  end
end
