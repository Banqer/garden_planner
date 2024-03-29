 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/garden_beds", type: :request do

  # GardenBed. As you add validations to GardenBed, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "Garden bed 1"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      GardenBed.create! valid_attributes
      get garden_beds_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      garden_bed = GardenBed.create! valid_attributes
      get garden_bed_url(garden_bed)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_garden_bed_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      garden_bed = GardenBed.create! valid_attributes
      get edit_garden_bed_url(garden_bed)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GardenBed" do
        expect {
          post garden_beds_url, params: { garden_bed: valid_attributes }
        }.to change(GardenBed, :count).by(1)
      end

      it "redirects to the created garden_bed" do
        post garden_beds_url, params: { garden_bed: valid_attributes }
        expect(response).to redirect_to(garden_bed_url(GardenBed.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GardenBed" do
        expect {
          post garden_beds_url, params: { garden_bed: invalid_attributes }
        }.to change(GardenBed, :count).by(0)
      end

      it "renders an unsuccessful response (i.e. to display the 'new' template)" do
        post garden_beds_url, params: { garden_bed: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "Garden bed 2"
        }
      }

      it "updates the requested garden_bed" do
        garden_bed = GardenBed.create! valid_attributes
        patch garden_bed_url(garden_bed), params: { garden_bed: new_attributes }
        garden_bed.reload
        expect(garden_bed.name).to eq "Garden bed 2"
      end

      it "redirects to the garden_bed" do
        garden_bed = GardenBed.create! valid_attributes
        patch garden_bed_url(garden_bed), params: { garden_bed: new_attributes }
        garden_bed.reload
        expect(response).to redirect_to(garden_bed_url(garden_bed))
      end
    end

    context "with invalid parameters" do
      it "renders an unsuccessful response (i.e. to display the 'edit' template)" do
        garden_bed = GardenBed.create! valid_attributes
        patch garden_bed_url(garden_bed), params: { garden_bed: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested garden_bed" do
      garden_bed = GardenBed.create! valid_attributes
      expect {
        delete garden_bed_url(garden_bed)
      }.to change(GardenBed, :count).by(-1)
    end

    it "redirects to the garden_beds list" do
      garden_bed = GardenBed.create! valid_attributes
      delete garden_bed_url(garden_bed)
      expect(response).to redirect_to(garden_beds_url)
    end
  end

  describe "POST /weed" do
    it "attepts to weed the requested plant" do
      garden_bed = GardenBed.create! valid_attributes

      expect_any_instance_of(GardenBed).to receive(:propagate_weeds!)

      get garden_bed_propagate_weeds_url(garden_bed)
    end
  end
end
