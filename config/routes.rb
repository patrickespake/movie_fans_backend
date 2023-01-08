Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :movies, only: [:index, :show]
      resources :owners, only: [:index, :show]
      resources :genres, only: [:index, :show]
    end
  end
end
