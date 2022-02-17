FactoryBot.define do
  factory :plant do
    species
    garden_bed
    name { "A lovely little plant" }
    planted_at { "2022-02-17 15:21:20" }
    harvest_at { "2022-02-17 15:21:20" }
  end
end
