Rails.application.routes.draw do
  root 'games#new'

  resources :games, only: %i[create show]

  resources :plays, only: %i[create]
end
