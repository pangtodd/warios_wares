Rails.application.routes.draw do
  root to: 'products#home'
  get "home", to:"products#home"
  resources :products do
    resources :reviews
  end
end
