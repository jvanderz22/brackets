Rails.application.routes.draw do

  get 'games'   => 'games#index'
  get 'games/:id'      => 'games#show'

  patch 'games/:id'    => 'games#update'

  get 'teams'      => 'teams#index'
  get 'teams/id'   => 'teams#show'

  get 'averages'   => 'averages#show'

  get '*path', to: 'home#index'
  root to: "home#index"
end
