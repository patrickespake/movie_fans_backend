require 'rails_helper'

RSpec.describe "Genres", type: :request do
  describe "GET /api/v1/genres" do
    it "returns a list of genres" do
      create_list(:genre, 3)
      get api_v1_genres_path
      expect(response).to have_http_status(200)
      expect(response.body).to eq(Genre.all.to_json)
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
