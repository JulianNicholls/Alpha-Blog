Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :articles

  get 'home', to:  'pages#home'
  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'

  root 'pages#home'
end
