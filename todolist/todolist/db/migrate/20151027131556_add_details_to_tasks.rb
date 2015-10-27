class AddDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :details, :string
  end
end
