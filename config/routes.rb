Rails.application.routes.draw do
  resources :stories
  resources :sessions, only: [:new, :create, :destroy]
  #get 'sessions/new'
  #post 'sessions/create'
  #get 'sessions/destroy'
  get 'users/sign_up', to: "users#new", as: 'users'
  post 'users/sign_up', to: "users#create"
  #get 'users/sign_in', to: 'sessions#new', as: 'sessions'
  get 'users/show'
  delete 'users/logout', to: 'sessions#destroy', as: 'destroy_user_session'
  
 
  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
