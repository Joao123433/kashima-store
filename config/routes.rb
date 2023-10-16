Rails.application.routes.draw do
  resources :clothings
  get 'inicio/index'
  root 'inicio#index'
  get 'inicio/compra'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
