require 'rails_helper'

RSpec.describe GardenBed, type: :model do
  describe "#species_list" do
    subject { garden_bed.species_list }

    let(:garden_bed) { FactoryBot.create :garden_bed, plants: [lettuce_plant1, tomato_plant] }
    let(:lettuce) { FactoryBot.create :species, name: "Lettuce" }
    let(:tomato) { FactoryBot.create :species, name: "Tomato" }
    let(:tomato_plant) { FactoryBot.create :plant, species: tomato }
    let(:lettuce_plant1) { FactoryBot.create :plant, species: lettuce }

    it "returns a list of the species in the garden bed" do
      expect(subject).to eq "Lettuce, Tomato"
    end

    context "whent here's more than one plant for a species" do
      let(:garden_bed) { FactoryBot.create :garden_bed, plants: [lettuce_plant1, lettuce_plant2, tomato_plant] }
      let(:lettuce_plant2) { FactoryBot.create :plant, species: lettuce }

      it "lists each species once" do
        expect(subject).not_to eq "Lettuce, Lettuce, Tomato"
      end
    end
  end
end
