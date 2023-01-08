require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies" do
    it "returns a list of movies" do
      create_list(:movie, 3)
      get movies_path
      expect(response).to have_http_status(200)
      expect(response.body).to eq(Movie.all.to_json)
    end
  end
  
  describe "GET /movies/:id" do
    it "returns a single movie" do
      movie = create(:movie)
      get movie_path(movie)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(movie.to_json)
    end
  end
end
