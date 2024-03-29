Rails.application.routes.draw do
  root "static_pages#home"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/index', to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
