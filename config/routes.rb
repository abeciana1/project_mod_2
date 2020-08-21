Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'

  resources :books, only: [:new, :create, :edit, :update, :index]
  resources :book_records
  resources :users
  resources :pergolas
  get '/', to: 'users#home', as: 'home'
  get '/about', to: 'users#about'
  get '/contact', to: 'users#contact'

  get '/contra', to: 'users#contra'
  put '/verify', to: 'users#verify', as: 'verify'

  get '/search_authors', to: 'book_records#search_authors', as: 'authors_search'
  put '/create_books', to: 'book_records#create_books', as: 'create_books'
  
  # get '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
