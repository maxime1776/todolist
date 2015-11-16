class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title
      t.string :address
      t.text :description
      t.float :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
