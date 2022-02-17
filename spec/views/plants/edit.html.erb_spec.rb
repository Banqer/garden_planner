require 'rails_helper'

RSpec.describe "plants/edit", type: :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
      name: "MyString",
      garden_bed: nil,
      species: nil
    ))
  end

  it "renders the edit plant form" do
    render

    assert_select "form[action=?][method=?]", plant_path(@plant), "post" do

      assert_select "input[name=?]", "plant[name]"

      assert_select "input[name=?]", "plant[garden_bed_id]"

      assert_select "input[name=?]", "plant[species_id]"
    end
  end
end
