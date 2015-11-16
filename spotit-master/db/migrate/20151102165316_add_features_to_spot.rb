class AddFeaturesToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :city, :string
    add_column :spots, :style, :string
    add_column :spots, :post_code, :integer
    add_column :spots, :area, :integer
    add_column :spots, :exposition, :string
    add_column :spots, :exceptional_view, :boolean
    add_column :spots, :modular_furniture, :boolean
  end
end
