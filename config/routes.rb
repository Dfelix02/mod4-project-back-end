Rails.application.routes.draw do
  resources :game_genres
  resources :reviews
  resources :likes
  resources :orders
  resources :items
  resources :categories
  resources :purchases
  post '/users/register', to: 'users#create' 
  post '/users/login', to: 'users#login' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
