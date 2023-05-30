Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'home/top'
  root 'home#top'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] 
  namespace :admin do
    resources :users, only: [:index]
  end
  
  resources :shops, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
