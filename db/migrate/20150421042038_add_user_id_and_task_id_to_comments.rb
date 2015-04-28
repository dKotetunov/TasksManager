class AddUserIdAndTaskIdToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :user_id
      t.integer :task_id
    end
    add_index :comments, :user_id
    add_index :comments, :task_id
  end
end
