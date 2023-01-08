require 'rails_helper'

RSpec.describe "Owners", type: :request do
  describe "GET /api/v1/owners" do
    let!(:owners) { create_list(:owner, 3) }

    it "returns a list of owners" do
      get api_v1_owners_path

      expect(response).to have_http_status(200)
      expect(response.body).to eq(Owner.all.to_json)
    end

    context "when searching" do
      let!(:owner) { create(:owner, name: "John") }

      it "returns a list of owners" do
        get api_v1_owners_path, params: { q: { name_cont: "john" } }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([owner].to_json)
      end
    end

    context "when paginating" do
      it "returns the first page" do
        get api_v1_owners_path, params: { page: 1, per_page: 1 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([owners[0]].to_json)
      end

      it "returns the second page" do
        get api_v1_owners_path, params: { page: 2, per_page: 2 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([owners[2]].to_json)
      end
    end
  end
  
  describe "GET /api/v1/owners/:id" do
    it "returns a single owner" do
      owner = create(:owner)
      get api_v1_owner_path(owner)

      expect(response).to have_http_status(200)
      expect(response.body).to eq(owner.to_json)
    end
  end  
end
