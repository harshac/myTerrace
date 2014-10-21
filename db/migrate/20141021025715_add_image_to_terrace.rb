class AddImageToTerrace < ActiveRecord::Migration
  def change
    add_column :terraces, :image, :string
  end
end
