class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :title
      t.string :sport
      t.string :brand
      t.text :description
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
