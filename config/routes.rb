Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'

  resources :books
  resources :book_records
  resources :users
  resources :pergolas
  get '/', to: 'users#home', as: 'home'
  get '/about', to: 'users#about'
  get '/contact', to: 'users#contact'

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'
  # get '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
