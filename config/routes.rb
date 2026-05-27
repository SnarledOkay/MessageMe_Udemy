Rails.application.routes.draw do
  root "pages#home"
  get 'sign-up', to: "users#new"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
end
