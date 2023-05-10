# Real-Time-Cart

This is a rails 7 application that updates cart information in real time.

Generating the skeleton app:
```
rails new real-time-cart --database=postgresql --skip-action-mailer --skip-action-text --skip-action-cable --skip-javascript --css tailwind -T cd real-time-cart
```

Getting it up and running:
```
rails db:create db:migrate && bin/dev
``` 

Generate models:
```
rails g model Product name price:float && rails g model order subtotal:float total:float && rails g model OrderItem order:references product:references quantity:integer total:float unitprice:float && rails db:migrate

```

Update routes file to:
```
  resources :products
  resources :order_items, only: [:create, :update, :destroy]
  root "products#index"
```