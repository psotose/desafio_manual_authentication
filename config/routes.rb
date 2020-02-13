Rails.application.routes.draw do
  resources :stories
  resources :sessions, only: [:new, :create, :destroy]
  #get 'sessions/new'
  #post 'sessions/create'
  #get 'sessions/destroy'
  get 'users/sign_up', to: "users#new"
  post 'users', to: "users#create"
  get 'users/sign_in', to: 'sessions#new'
  get 'users/show'
  
 
  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
