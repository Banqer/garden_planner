class CreateGardenBeds < ActiveRecord::Migration[6.1]
  def change
    create_table :garden_beds do |t|
      t.string :name
      t.datetime :last_weeded_at

      t.timestamps
    end
  end
end
