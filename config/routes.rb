Rails.application.routes.draw do
  resources :products
  resources :order_items, only: [:create, :update, :destroy]
  root "products#index"
end
