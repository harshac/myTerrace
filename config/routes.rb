Rails.application.routes.draw do
  root 'home#index'

  post '/search' => 'search#index'
  resources :terraces, only: [:new, :create, :index]
end
