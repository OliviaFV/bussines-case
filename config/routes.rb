Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'products', to: 'products#index'
  resources :cart_items, only: [:create, :destroy]
end
