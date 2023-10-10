Rails.application.routes.draw do
  resources :categolies
  resources :favorites
  resources :shoppings
  resources :blocks
  get 'home/top'
  root to:'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
end