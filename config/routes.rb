Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
