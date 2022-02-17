class Plant < ApplicationRecord
  belongs_to :garden_bed
  belongs_to :species
end
