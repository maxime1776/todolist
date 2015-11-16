class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.float :total_price
      t.datetime :start_time
      t.datetime :end_time
      t.references :spot, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
