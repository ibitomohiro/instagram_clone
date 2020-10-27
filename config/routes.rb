Rails.application.routes.draw do
  root 'pages#home'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" 
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy, :index]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
