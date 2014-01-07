class AddDelegatedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :delegated_id, :integer
    add_index :tasks, :delegated_id
  end
end
