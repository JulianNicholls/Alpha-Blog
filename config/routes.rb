Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :articles

  get 'home',  to: 'pages#home'
  get 'about', to: 'pages#about'

  get 'signup',     to: 'users#new'
  get 'login',      to: 'sessions#new'
  post 'login',     to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  root 'pages#home'
end
