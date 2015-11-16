class AddActivityIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :activity_id, :integer
  end
end
