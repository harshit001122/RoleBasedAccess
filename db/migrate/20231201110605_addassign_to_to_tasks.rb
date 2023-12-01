class AddassignToToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :assign_to, :string
  end
end
