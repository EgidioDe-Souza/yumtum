Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/meals', to: 'meals#index'
  get '/meals/new', to: 'meals#new', as: 'new_meal'
  post '/meals', to: 'meals#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
