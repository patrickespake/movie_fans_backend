Rails.application.routes.draw do
  apipie
  
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :movies, only: [:index, :show]
      resources :owners, only: [:index, :show]
      resources :genres, only: [:index, :show]
    end
  end

  root 'apipie/apipies#index'
end
