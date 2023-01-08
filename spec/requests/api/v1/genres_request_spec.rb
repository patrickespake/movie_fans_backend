require 'rails_helper'

RSpec.describe "Genres", type: :request do
  describe "GET /api/v1/genres" do
    let!(:genres) { create_list(:genre, 3) }

    it "returns a list of genres" do
      get api_v1_genres_path

      expect(response).to have_http_status(200)
      expect(response.body).to eq(Genre.all.to_json)
    end

    context "when searching" do
      let!(:genre) { create(:genre, name: "Action") }

      it "returns a list of genres" do
        get api_v1_genres_path, params: { q: { name_cont: "action" } }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([genre].to_json)
      end
    end

    context "when paginating" do
      it "returns the first page" do
        get api_v1_genres_path, params: { page: 1, per_page: 1 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([genres[0]].to_json)
      end

      it "returns the second page" do
        get api_v1_genres_path, params: { page: 2, per_page: 2 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([genres[2]].to_json)
      end
    end
  end
  
  describe "GET /api/v1/genres/:id" do
    it "returns a single genre" do
      genre = create(:genre)
      get api_v1_genre_path(genre)

      expect(response).to have_http_status(200)
      expect(response.body).to eq(genre.to_json)
    end
  end
end
