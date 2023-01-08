class Api::V1::GenresController < ApplicationController
  api :GET, '/api/v1/genres', 'List all genres'
  param :page, :number, desc: 'Page number', required: false
  param :size_per_page, :number, desc: 'Number of genres per page', required: false
  returns code: 200 do
    property :id, Integer, desc: 'Genre ID'
    property :name, String, desc: 'Genre name'
    property :parameterized_name, String, desc: 'Genre parameterized name'
    property :created_at, DateTime, desc: 'Genre created at'
    property :updated_at, DateTime, desc: 'Genre updated at'
  end
  example <<-EOS
    [
      {
        "id": 1,
        "name": "Action",
        "parameterized_name": "action",
        "created_at": "2023-01-08T19:09:37.845Z",
        "updated_at": "2023-01-08T19:09:37.845Z"
      },
      { 
        ... 
      }
    ]
  EOS
  formats ['json']
  def index
    genres = Genre.ransack(params[:q]).result.includes(:movies).page(params[:page]).per_page(size_per_page)
    render json: genres
  end

  api :GET, '/api/v1/genres/:id', 'Show a genre'
  param :id, :number, desc: 'Genre ID', required: true
  returns code: 200 do
    property :id, Integer, desc: 'Genre ID'
    property :name, String, desc: 'Genre name'
    property :parameterized_name, String, desc: 'Genre parameterized name'
    property :created_at, DateTime, desc: 'Genre created at'
    property :updated_at, DateTime, desc: 'Genre updated at'
  end
  example <<-EOS
    {
      "id": 1,
      "name": "Action",
      "parameterized_name": "action",
      "created_at": "2023-01-08T19:09:37.845Z",
      "updated_at": "2023-01-08T19:09:37.845Z"
    }
  EOS
  formats ['json']
  def show
    genre = Genre.find(params[:id])
    render json: genre
  end
end
