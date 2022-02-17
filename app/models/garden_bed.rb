class GardenBed < ApplicationRecord

  scope :ready_to_weed, -> { where('last_weeded_at < ?', 1.month.ago )}
end
