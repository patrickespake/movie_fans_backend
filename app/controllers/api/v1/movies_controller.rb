class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.ransack(params[:q]).result.includes(:owner, :genres).page(params[:page])
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end
end
