class Api::V1::MoviesController < ApplicationController
  # Concerns
  include Api::V1::Docs::Movies

  def index
    movies = Movie.ransack(params[:q]).result.includes(:owner, :genres).page(params[:page]).per_page(size_per_page)
    render json: movies.to_json(include: [:owner, :genres])
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie.to_json(include: [:owner, :genres])
  end
end
