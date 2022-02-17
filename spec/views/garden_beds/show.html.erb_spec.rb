require 'rails_helper'

RSpec.describe "garden_beds/show", type: :view do
  before(:each) do
    @garden_bed = assign(:garden_bed, GardenBed.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
