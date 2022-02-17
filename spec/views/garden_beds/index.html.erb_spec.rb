require 'rails_helper'

RSpec.describe "garden_beds/index", type: :view do
  before(:each) do
    assign(:garden_beds, [
      GardenBed.create!(
        name: "Name"
      ),
      GardenBed.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of garden_beds" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
