Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :new] do
    resources :requests, only: [:new, :create]
  end
  resources :requests, only: [:index, :update] do
    resources :reviews, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
