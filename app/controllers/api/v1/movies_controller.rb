class Api::V1::MoviesController < ApplicationController
  api :GET, '/api/v1/movies', 'List all movies'
  param :q, Hash, desc: 'Ransack query params'
  param :page, :number, desc: 'Page number', required: false
  param :size_per_page, :number, desc: 'Number of movies per page', required: false
  returns code: 200 do
    property :id, Integer, desc: 'Movie ID'
    property :name, String, desc: 'Movie name'
    property :parameterized_name, String, desc: 'Movie parameterized name'
    property :thumbnail, String, desc: 'Movie thumbnail'
    property :image, String, desc: 'Movie image'
    property :market_price, Float, desc: 'Movie market price'
    property :owner_id, Integer, desc: 'Movie owner ID'
    property :created_at, DateTime, desc: 'Movie created at'
    property :updated_at, DateTime, desc: 'Movie updated at'
    property :owner, Hash, desc: 'Movie owner' do
      property :id, Integer, desc: 'Owner ID'
      property :name, String, desc: 'Owner name'
      property :parameterized_name, String, desc: 'Owner parameterized name'
      property :created_at, DateTime, desc: 'Owner created at'
      property :updated_at, DateTime, desc: 'Owner updated at'
    end
    property :genres, Array, desc: 'Movie genres' do
      property :id, Integer, desc: 'Genre ID'
      property :name, String, desc: 'Genre name'
      property :parameterized_name, String, desc: 'Genre parameterized name'
      property :created_at, DateTime, desc: 'Genre created at'
      property :updated_at, DateTime, desc: 'Genre updated at'
    end
  end
  example <<-EOS
    [
      {
        "id": 1,
        "name": "Captains of the Clouds",
        "parameterized_name": "captains-of-the-clouds",
        "thumbnail": "http://dummyimage.com/100x100.png/5fa2dd/ffffff",
        "image": "http://dummyimage.com/400x.png/dddddd/000000",
        "market_price": 25.19,
        "owner_id": 1,
        "created_at": "2023-01-08T19:09:37.845Z",
        "updated_at": "2023-01-08T19:09:37.845Z",
        "owner": {
          "id": 1,
          "name": "Martin Lopez",
          "parameterized_name": "martin-lopez",
          "created_at": "2023-01-08T19:09:37.845Z",
          "updated_at": "2023-01-08T19:09:37.845Z"
        },
        "genres": [
          {
            "id": 1,
            "name": "Action",
            "parameterized_name": "action",
            "created_at": "2023-01-08T19:09:37.845Z",
            "updated_at": "2023-01-08T19:09:37.845Z"
          }
        ]
      },
      {
        ...
      }
    ]
  EOS
  formats ['json']
  def index
    movies = Movie.ransack(params[:q]).result.includes(:owner, :genres).page(params[:page]).per_page(size_per_page)
    render json: movies.to_json(include: [:owner, :genres])
  end

  api :GET, '/api/v1/movies/:id', 'Show a movie'
  param :id, :number, desc: 'Movie ID', required: true
  returns code: 200 do
    property :id, Integer, desc: 'Movie ID'
    property :name, String, desc: 'Movie name'
    property :parameterized_name, String, desc: 'Movie parameterized name'
    property :thumbnail, String, desc: 'Movie thumbnail'
    property :image, String, desc: 'Movie image'
    property :market_price, Float, desc: 'Movie market price'
    property :owner_id, Integer, desc: 'Movie owner ID'
    property :created_at, DateTime, desc: 'Movie created at'
    property :updated_at, DateTime, desc: 'Movie updated at'
    property :owner, Hash, desc: 'Movie owner' do
      property :id, Integer, desc: 'Owner ID'
      property :name, String, desc: 'Owner name'
      property :parameterized_name, String, desc: 'Owner parameterized name'
      property :created_at, DateTime, desc: 'Owner created at'
      property :updated_at, DateTime, desc: 'Owner updated at'
    end
    property :genres, Array, desc: 'Movie genres' do
      property :id, Integer, desc: 'Genre ID'
      property :name, String, desc: 'Genre name'
      property :parameterized_name, String, desc: 'Genre parameterized name'
      property :created_at, DateTime, desc: 'Genre created at'
      property :updated_at, DateTime, desc: 'Genre updated at'
    end
  end
  example <<-EOS
    {
      "id": 1,
      "name": "Captains of the Clouds",
      "parameterized_name": "captains-of-the-clouds",
      "thumbnail": "http://dummyimage.com/100x100.png/5fa2dd/ffffff",
      "image": "http://dummyimage.com/400x.png/dddddd/000000",
      "market_price": 25.19,
      "owner_id": 1,
      "created_at": "2023-01-08T19:09:37.845Z",
      "updated_at": "2023-01-08T19:09:37.845Z",
      "owner": {
        "id": 1,
        "name": "Martin Lopez",
        "parameterized_name": "martin-lopez",
        "created_at": "2023-01-08T19:09:37.845Z",
        "updated_at": "2023-01-08T19:09:37.845Z"
      },
      "genres": [
        {
          "id": 1,
          "name": "Action",
          "parameterized_name": "action",
          "created_at": "2023-01-08T19:09:37.845Z",
          "updated_at": "2023-01-08T19:09:37.845Z"
        }
      ]
    }
  EOS
  formats ['json']
  def show
    movie = Movie.find(params[:id])
    render json: movie.to_json(include: [:owner, :genres])
  end
end
