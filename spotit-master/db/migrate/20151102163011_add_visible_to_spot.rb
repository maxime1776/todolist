class AddVisibleToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :visible, :boolean, :default => false
  end
end
