class Api::V1::GenresController < ApplicationController
  def index
    genres = Genre.ransack(params[:q]).result.includes(:movies).page(params[:page]).per_page(size_per_page)
    render json: genres
  end

  def show
    genre = Genre.find(params[:id])
    render json: genre
  end
end
