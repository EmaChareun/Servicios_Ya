Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :show, :new, :edit, :update] do
    resources :requests, only: [:new, :create]

  end
  resources :requests, only: [:index, :update, :edit] do
    resources :reviews, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
