class HomeController < ApplicationController
  def index
    @recent_plants = Plant.recently_planted
    @harvestable_plants = Plant.harvestable
    @beds_ready_to_weed = GardenBed.ready_to_weed
  end
end
