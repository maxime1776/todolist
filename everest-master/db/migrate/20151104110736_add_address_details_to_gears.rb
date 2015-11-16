class AddAddressDetailsToGears < ActiveRecord::Migration
  def change
    add_column :gears, :address, :string
    add_column :gears, :city, :string
    add_column :gears, :zipcode, :string
  end
end
