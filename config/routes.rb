Rails.application.routes.draw do

  get 'home', to:  'pages#home'
  get 'about', to: 'pages#about'

  root 'pages#home'

end
