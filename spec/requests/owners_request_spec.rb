require 'rails_helper'

RSpec.describe "Owners", type: :request do
  describe "GET /owners" do
    it "returns a list of owners" do
      create_list(:owner, 3)
      get owners_path
      expect(response).to have_http_status(200)
      expect(response.body).to eq(Owner.all.to_json)
    end
  end
  
  describe "GET /owners/:id" do
    it "returns a single owner" do
      owner = create(:owner)
      get owner_path(owner)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(owner.to_json)
    end
  end  
end
