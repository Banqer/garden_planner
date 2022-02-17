require 'rails_helper'

RSpec.describe "species/index", type: :view do
  before(:each) do
    assign(:species, [
      Species.create!(
        name: "Name"
      ),
      Species.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of species" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
