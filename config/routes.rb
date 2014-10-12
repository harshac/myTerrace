Rails.application.routes.draw do
  root 'home#index'

  post '/search' => 'search#index'
end
