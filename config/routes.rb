Rails.application.routes.draw do
  resources :averages

  resources :games
  resources :teams
  get '*path', to: 'home#index'
  root to: "home#index"
end
