module Api::V1::Docs::Genres
  extend Apipie::DSL::Concern

  api :GET, '/v1/genres', 'List all genres'
  param :q, Hash, desc: 'Ransack query params'
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
  def index; end

  api :GET, '/v1/genres/:id', 'Show a genre'
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
  def show; end
end