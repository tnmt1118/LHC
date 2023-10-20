Rails.application.routes.draw do
  get 'recipes/display'
  get 'recipes/details'
  get 'displays/display'
  get 'recipes/search'
  resources :categories
  resources :favorites
  resources :shoppings
  resources :blocks
  get 'home/top'
  root to:'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/profile', to: 'users#show'
  delete '/unsubscribe', to: 'users#destroy'
  
  #get '/users/:id', to: 'users#show', as: 'profile'
  #delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end