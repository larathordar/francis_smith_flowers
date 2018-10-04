Rails.application.routes.draw do
  get 'pricing/index'
  get 'pricing/weekly'
  get 'pricing/monthly'
  get 'pricing/fortnightly'



  resources :subscriptions
  devise_for :users
  post '/charges', controller: :subscriptions, action: :create
  get 'flowers/home'
  get 'landing/index'
  root controller: :landing, action: :index
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  resources :pricing, only:[:index]
  resources :purchases, only: [:show]
  get 'flowers/new'
  post 'flowers/create'
end
