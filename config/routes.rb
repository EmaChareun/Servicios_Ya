Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :show, :new, :edit, :update] do
    resources :requests, only: [:new, :create]

  end
  resources :requests, only: [:index, :update, :edit] do
    resources :reviews, only: [:new, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
