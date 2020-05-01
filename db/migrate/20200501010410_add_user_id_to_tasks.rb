class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: true, index: true
    change_column :tasks, :user_id, :integer, null: false
  end

  def down
    remove_reference :tasks, :user, index: true
  end

end
