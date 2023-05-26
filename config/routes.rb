Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'home/top'
  root 'home#top'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      get 'edit', to: 'users#edit'
    end
  end
  patch '/users/:id', to: 'users#edit', as: 'update_user'
  resources :shops do
    post 'scrape', on: :member
  end
  get 'shops', to: 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
