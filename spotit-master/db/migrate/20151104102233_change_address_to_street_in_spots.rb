class ChangeAddressToStreetInSpots < ActiveRecord::Migration
  def change
    rename_column :spots, :address, :street
  end
end
