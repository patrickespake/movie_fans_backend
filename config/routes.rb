Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :owners, only: [:index, :show]
  resources :genres, only: [:index, :show]
end
