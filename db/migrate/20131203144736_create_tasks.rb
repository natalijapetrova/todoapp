class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :deadline
      t.boolean :done
      t.float :duration

      t.timestamps
    end
  end
end
