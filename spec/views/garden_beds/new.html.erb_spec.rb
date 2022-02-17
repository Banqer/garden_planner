require 'rails_helper'

RSpec.describe "garden_beds/new", type: :view do
  before(:each) do
    assign(:garden_bed, GardenBed.new(
      name: "MyString"
    ))
  end

  it "renders new garden_bed form" do
    render

    assert_select "form[action=?][method=?]", garden_beds_path, "post" do

      assert_select "input[name=?]", "garden_bed[name]"
    end
  end
end
