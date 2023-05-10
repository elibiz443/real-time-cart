Rails.application.routes.draw do
  get 'carts/headerinfo'
  resources :products
  resources :order_items, only: [:create, :update, :destroy]
  root "products#index"
end
