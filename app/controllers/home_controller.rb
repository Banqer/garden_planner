class HomeController < ApplicationController
  def index
    @recent_plants = Plant.recently_planted.order(:planted_at)
    @harvestable_plants = Plant.harvestable.order(:harvest_at)
    @beds_ready_to_weed = GardenBed.ready_to_weed.order(:last_weeded_at)
  end
end
