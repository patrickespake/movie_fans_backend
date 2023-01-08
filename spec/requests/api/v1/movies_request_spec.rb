require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /api/v1/movies" do
    let!(:movies) { create_list(:movie, 3) }

    it "returns a list of movies" do
      get api_v1_movies_path

      expect(response).to have_http_status(200)
      expect(response.body).to eq(Movie.all.to_json(include: [:owner, :genres]))
    end

    context "when searching" do
      let!(:movie) { create(:movie, name: "The Matrix") }

      it "returns a list of movies" do
        get api_v1_movies_path, params: { q: { name_cont: "matrix" } }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([movie].to_json(include: [:owner, :genres]))
      end
    end

    context "when paginating" do
      it "returns the first page" do
        get api_v1_movies_path, params: { page: 1, per_page: 1 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([movies[0]].to_json(include: [:owner, :genres]))
      end

      it "returns the second page" do
        get api_v1_movies_path, params: { page: 2, per_page: 2 }

        expect(response).to have_http_status(200)
        expect(response.body).to eq([movies[2]].to_json(include: [:owner, :genres]))
      end
    end
  end
  
  describe "GET /api/v1/movies/:id" do
    it "returns a single movie" do
      movie = create(:movie)
      get api_v1_movie_path(movie)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(movie.to_json(include: [:owner, :genres]))
    end
  end
end
