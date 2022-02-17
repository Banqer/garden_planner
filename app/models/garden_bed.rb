class GardenBed < ApplicationRecord
  has_many :plants
  has_many :species, through: :plants

  validates :name, presence: true

  scope :ready_to_weed, -> { where('last_weeded_at < ?', 1.month.ago )}

  def species_list
    species.uniq
           .map(&:name)
           .join(", ")
  end
end
