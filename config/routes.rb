Rails.application.routes.draw do
  resources :attractions

  resources :rides

  resources :users

  root 'welcome#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy' 



end
