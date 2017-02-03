Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  get '/notreturned', to: 'pages#notreturned'
  get 'pages/home'

  resources :books
  resources :rents
  resources :students

  root "rents#index"

  match 'rents(/:id)/bring', to: 'rents#bring', via: [:post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
