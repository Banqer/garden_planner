require 'rails_helper'

RSpec.describe "garden_beds/edit", type: :view do
  before(:each) do
    @garden_bed = assign(:garden_bed, GardenBed.create!(
      name: "MyString"
    ))
  end

  it "renders the edit garden_bed form" do
    render

    assert_select "form[action=?][method=?]", garden_bed_path(@garden_bed), "post" do

      assert_select "input[name=?]", "garden_bed[name]"
    end
  end
end
