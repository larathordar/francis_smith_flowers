Rails.application.routes.draw do
  get 'flowers/home'
  get 'landing/index'
  root controller: :landing, action: :index
  match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]
end
