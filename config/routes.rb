Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'products#index'
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new', as: 'new_product'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show', as: 'product'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'
  post '/products/search', to: 'products#search'

  get '/suppliers', to: 'suppliers#index'
  # get '/suppliers/new', to: 'suppliers#new'
  # post '/suppliers', to: 'suppliers#create'
  # get '/suppliers/:id', to: 'suppliers#show'
  # get '/suppliers/:id/edit', to: 'suppliers#edit'
  # patch '/suppliers/:id', to: 'suppliers#update'
  # delete '/suppliers/:id', to: 'suppliers#destroy'

  get '/images/new', to: 'images#new', as: 'new_image'
  post '/images', to: 'images#create'

  get 'signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/orders/new', to: 'orders#new', as: 'new_order'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show', as: 'order'
  get '/orders', to: 'orders#index'
  get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
  patch '/orders/:id', to: 'orders#update'

  get '/carted_products', to: 'carted_products#index'
  get '/carted_products/new', to: 'carted_products#new', as: 'new_carted_product'
  post '/carted_products', to: 'carted_products#create'
  delete '/carted_products/:id', to: 'carted_products#destroy'
 
end
