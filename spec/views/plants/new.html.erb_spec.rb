require 'rails_helper'

RSpec.describe "plants/new", type: :view do
  before(:each) do
    assign(:plant, Plant.new(
      name: "MyString",
      garden_bed: nil,
      species: nil
    ))
  end

  it "renders new plant form" do
    render

    assert_select "form[action=?][method=?]", plants_path, "post" do

      assert_select "input[name=?]", "plant[name]"

      assert_select "input[name=?]", "plant[garden_bed_id]"

      assert_select "input[name=?]", "plant[species_id]"
    end
  end
end
