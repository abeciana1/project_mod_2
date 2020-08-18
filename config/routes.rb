Rails.application.routes.draw do
  resources :books
  resources :book_records
  resources :users
  resources :pergolas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
