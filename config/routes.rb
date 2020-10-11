Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
end
