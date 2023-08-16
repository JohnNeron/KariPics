Rails.application.routes.draw do
  get 'home/index'
  resources :kcomments
  resources :karticles
  devise_for :kusers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
