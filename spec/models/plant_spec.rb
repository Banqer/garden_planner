require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe "#weed!" do
    subject { plant.weed! }

    let!(:plant) { FactoryBot.create(:plant, garden_bed: garden_bed, species: species) }
    let(:garden_bed) { FactoryBot.create(:garden_bed) }

    context "when the plan is a weed" do
      let(:species) { FactoryBot.create(:species, weed: true) }

      it "destroys the plant" do
        expect { subject }.to change { Plant.count }.from(1).to(0)
      end

      it "updates the garden bed's last_weeded_at timestamp" do
        expect { subject }.to change { garden_bed.last_weeded_at }
      end
    end

    context "when the plant is not a weed" do
      let(:species) { FactoryBot.create(:species, weed: false) }

      it "raises an error"
    end
  end
end
