Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/meals', to: 'meals#index'
  get '/meals/new', to: 'meals#new', as: 'new_meal'
  post '/meals', to: 'meals#create'
  get '/meals/:id', to: 'meals#show', as: 'show_meal'
  get '/meals/:id/purchases/new', to: 'purchases#new' , as: 'new_purchase'
  post '/meals/:id/purchases', to: 'purchases#create', as:   'create_purchase'
  get '/purchases', to: 'purchases#index'

  resources :purchases, only: :destroy

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
