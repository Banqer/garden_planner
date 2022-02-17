class Plant < ApplicationRecord
  belongs_to :garden_bed
  belongs_to :species

  validates :name, presence: true

  scope :recently_planted, -> { where('planted_at > ?', 1.month.ago )}
  scope :harvestable, -> { where('harvest_at < ?', Time.now )}

  class CantWeedPlantError < StandardError; end

  def weed!
    raise CantWeedPlantError.new("#{name} isn't a weed!") unless species.weed?

    garden_bed.update(last_weeded_at: Time.now)

    destroy
  end
end
