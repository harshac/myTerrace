class CreateTerraces < ActiveRecord::Migration
  def change
    create_table :terraces do |t|
      t.references :owner, index: true
      t.decimal :rent
      t.decimal :area
      t.string :location
      t.integer :capacity

      t.timestamps
    end
  end
end
