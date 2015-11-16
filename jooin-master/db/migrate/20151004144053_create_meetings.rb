class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :leader_id
      t.timestamps null: false
    end
  end
end
