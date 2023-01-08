module Api::V1::Docs::Owners
  extend Apipie::DSL::Concern

  api :GET, '/api/v1/owners', 'List all owners'
  param :q, Hash, desc: 'Ransack query params'
  param :page, :number, desc: 'Page number', required: false
  param :size_per_page, :number, desc: 'Number of owners per page', required: false
  returns code: 200 do
    property :id, Integer, desc: 'Owner ID'
    property :name, String, desc: 'Owner name'
    property :parameterized_name, String, desc: 'Owner parameterized name'
    property :created_at, DateTime, desc: 'Owner created at'
    property :updated_at, DateTime, desc: 'Owner updated at'
  end
  example <<-EOS
    [
      {
        "id": 1,
        "name": "Martin Lopez",
        "parameterized_name": "martin-lopez",
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

  api :GET, '/api/v1/owners/:id', 'Show an owner'
  param :id, :number, desc: 'Owner ID', required: true
  returns code: 200 do
    property :id, Integer, desc: 'Owner ID'
    property :name, String, desc: 'Owner name'
    property :parameterized_name, String, desc: 'Owner parameterized name'
    property :created_at, DateTime, desc: 'Owner created at'
    property :updated_at, DateTime, desc: 'Owner updated at'
  end
  example <<-EOS
    {
      "id": 1,
      "name": "Martin Lopez",
      "parameterized_name": "martin-lopez",
      "created_at": "2023-01-08T19:09:37.845Z",
      "updated_at": "2023-01-08T19:09:37.845Z"
    }
  EOS
  formats ['json']
  def show; end
end