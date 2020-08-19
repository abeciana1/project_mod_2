Rails.application.routes.draw do
  resources :books
  resources :book_records
  resources :users
  resources :pergolas
  get '/', to: 'users#home'
  get '/about', to: 'users#about'
  get '/contact', to: 'users#contact'
  # get '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
