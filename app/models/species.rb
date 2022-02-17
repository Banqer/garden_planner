class Species < ApplicationRecord
  has_many :plants
  has_many :garden_beds, through: :plants
end
