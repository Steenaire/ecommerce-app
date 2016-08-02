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
 
end
