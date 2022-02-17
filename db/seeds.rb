# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Broccoli", "Cabbage", "Carrot", "Kumara", "Potato"].each do |species_name|
  Species.create(name: species_name)
end

GardenBed.create(
  name: "Front Garden Bed",
  last_weeded_at: 3.months.ago
)

GardenBed.create(
  name: "Back Garden Bed",
  last_weeded_at: 2.days.ago
)

Plant.create(
  name: "Broccoli Plant 1",
  species: Species.find_by(name: "Broccoli"),
  garden_bed: GardenBed.find_by(name: "Front Garden Bed"),
  planted_at: 1.day.ago,
  harvest_at: 6.months.from_now
)

Plant.create(
  name: "Broccoli Plant 2",
  species: Species.find_by(name: "Broccoli"),
  garden_bed: GardenBed.find_by(name: "Front Garden Bed"),
  planted_at: 1.day.ago,
  harvest_at: 6.months.from_now
)

Plant.create(
  name: "Cabbage Plant 1",
  species: Species.find_by(name: "Cabbage"),
  garden_bed: GardenBed.find_by(name: "Front Garden Bed"),
  planted_at: 1.day.ago,
  harvest_at: 6.months.from_now
)

Plant.create(
  name: "Kumara Plant 1",
  species: Species.find_by(name: "Kumara"),
  garden_bed: GardenBed.find_by(name: "Back Garden Bed"),
  planted_at: 3.months.ago,
  harvest_at: 1.week.ago
)

Plant.create(
  name: "Potato Plant 1",
  species: Species.find_by(name: "Potato"),
  garden_bed: GardenBed.find_by(name: "Back Garden Bed"),
  planted_at: 3.months.ago,
  harvest_at: 1.week.ago
)

Plant.create(
  name: "Potato Plant 2",
  species: Species.find_by(name: "Potato"),
  garden_bed: GardenBed.find_by(name: "Back Garden Bed"),
  planted_at: 1.months.ago,
  harvest_at: 2.months.from_now
)