class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :date
      t.references :terraces, index: true

      t.timestamps
    end
  end
end
