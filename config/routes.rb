Rails.application.routes.draw do
  root 'home#upcoming'
  get '/home' => 'home#index'

  get '/search' => 'search#index'
  resources :terraces, only: [:new, :create, :index]
end
