class RemoveStreetCityPostCode < ActiveRecord::Migration
  def change
    remove_column :spots, :street
    remove_column :spots, :city
    remove_column :spots, :post_code
  end
end
