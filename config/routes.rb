Rails.application.routes.draw do
  root 'home#index'

  get '/search' => 'search#index'
  resources :terraces, only: [:new, :create, :index]
end
