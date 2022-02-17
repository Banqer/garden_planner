class AddWeedToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_column :species, :weed, :boolean, default: false
  end
end
