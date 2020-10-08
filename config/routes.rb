Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destory]
end
