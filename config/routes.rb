Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  get 'home/top'
  root 'home#top'
  resource :user, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
