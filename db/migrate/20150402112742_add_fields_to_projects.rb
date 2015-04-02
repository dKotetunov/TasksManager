class AddFieldsToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
    add_index :projects, :user_id
  end
end
