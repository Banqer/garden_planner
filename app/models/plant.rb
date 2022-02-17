class Plant < ApplicationRecord
  belongs_to :garden_bed
  belongs_to :species

  scope :recently_planted, -> { where('planted_at > ?', 1.month.ago )}
  scope :harvestable, -> { where('harvest_at < ?', Time.now )}
end
