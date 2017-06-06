Rails.application.routes.draw do
  resources :users
  resources :posts, only: [:new, :create, :index]
  
  root 'static_pages#home'
  get 'static_pages/home'

  get 'sessions/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
