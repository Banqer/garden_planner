require "rails_helper"

RSpec.describe GardenBedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/garden_beds").to route_to("garden_beds#index")
    end

    it "routes to #new" do
      expect(get: "/garden_beds/new").to route_to("garden_beds#new")
    end

    it "routes to #show" do
      expect(get: "/garden_beds/1").to route_to("garden_beds#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/garden_beds/1/edit").to route_to("garden_beds#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/garden_beds").to route_to("garden_beds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/garden_beds/1").to route_to("garden_beds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/garden_beds/1").to route_to("garden_beds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/garden_beds/1").to route_to("garden_beds#destroy", id: "1")
    end
  end
end
