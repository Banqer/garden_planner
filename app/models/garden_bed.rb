class GardenBed < ApplicationRecord
  has_many :plants
  has_many :species, through: :plants

  validates :name, presence: true

  scope :ready_to_weed, -> { where('last_weeded_at < ?', 1.month.ago )}

  CHANCE_OF_WEED_PER_DAY = 0.1

  def species_list
    species.uniq
           .map(&:name)
           .join(", ")
  end

  def propagate_weeds!
    start_date = last_weeded_at.to_date
    end_date = Date.current
    (start_date..end_date).each do
      generate_weed! if SecureRandom.random_number < CHANCE_OF_WEED_PER_DAY
    end
  end

  private

  def generate_weed!
    weed_species = Species.weeds.sample
    plants << Plant.new(
      species: weed_species,
      name: "#{weed_species.name} Plant"
    )
  end
end
