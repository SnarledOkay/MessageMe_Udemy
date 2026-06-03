Rails.application.routes.draw do
  # root "pages#home"
  root "pages#home"
  resources :chatrooms
  resources :users, except: [:index] do
    member do
      get :friend_requests
    end
  end
  get "friends", to: "users#index", as: "friends"

  resources :friendships, only: [:index,:update,:create,:destroy]
  get 'about', to: "pages#about"
  get 'sign-up', to: "users#new"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :messages, except: [:show]
end
