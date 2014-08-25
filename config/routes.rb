Rails.application.routes.draw do
  resources :games
  resources :teams
  get '*path', to: 'home#index'
  root to: "home#index"
end
