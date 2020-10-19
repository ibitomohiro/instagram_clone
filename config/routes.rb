Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy, :index]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
