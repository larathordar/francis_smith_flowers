Rails.application.routes.draw do
  get 'flowers/home'
  get 'landing/index'
  root controller: :landing, action: :index
end
