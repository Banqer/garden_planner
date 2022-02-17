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

    context "when there's more than one plant for a species" do
      let(:garden_bed) { FactoryBot.create :garden_bed, plants: [lettuce_plant1, lettuce_plant2, tomato_plant] }
      let(:lettuce_plant2) { FactoryBot.create :plant, species: lettuce }

      it "lists each species once" do
        expect(subject).not_to eq "Lettuce, Lettuce, Tomato"
      end
    end
  end

  describe "#propagate_weeds!" do
    subject { garden_bed.propagate_weeds! }

    let!(:plant) { FactoryBot.create :plant, garden_bed: garden_bed, species: lettuce }
    let!(:weed_species) { FactoryBot.create :species, weed: true }
    let(:lettuce) { FactoryBot.create :species, name: "Lettuce", weed: false }
    let(:garden_bed) { FactoryBot.create :garden_bed, last_weeded_at: 3.days.ago }

    before do
      # Weed propagation is normally random, which could give us different
      # results each time this test is run. To ensure we always get some weeds
      # we're overriding SecureRandom to give the same value every time we run
      # the test
      allow(SecureRandom).to receive(:random_number).and_return(0.05)
    end

    it "adds weeds to the garden bed" do
      expect { subject }.to change { garden_bed.plants.count }
      expect(garden_bed.plants.order(:created_at).last.species.weed?).to be true
    end
  end
end
