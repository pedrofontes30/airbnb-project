Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lessons do
    resources :appointments, only: [:create]
    resources :reviews, only: [:create]
  end
  get '/profile', to: 'pages#profile'
  resources :appointments, only: [:destroy]
end
