class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :booking, index: true, foreign_key: true
      t.integer :rating
      t.text :description
      t.boolean :customer_review

      t.timestamps null: false
    end
  end
end
