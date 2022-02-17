class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.datetime :planted_at
      t.datetime :harvest_at
      t.belongs_to :garden_bed, null: false, foreign_key: true
      t.belongs_to :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
