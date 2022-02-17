class Species < ApplicationRecord
  has_many :plants
  has_many :garden_beds, through: :plants

  validates :name, presence: true

  scope :weeds, -> { where(weed: true) }
end
