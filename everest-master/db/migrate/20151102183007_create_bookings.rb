class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.references :gear, index: true, foreign_key: true
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
