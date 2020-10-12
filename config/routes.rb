Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
end
