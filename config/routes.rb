Rails.application.routes.draw do

  root "welcome#about"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create" 
  delete '/logout', to: "sessions#destroy"

  get 'users/:id', to: "users#show", as: "profile"

  resources :rooms, param: :name
  resources :messages
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
