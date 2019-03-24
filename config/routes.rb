Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  get '/products' => 'products#index'
  get 'products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  post '/products' => 'products#create'
  get '/products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'

  namespace :api do
    get '/products' => 'products#index'
    #get '/products' => 'products#show'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    get '/suppliers' => 'suppliers#index'
    get '/suppliers/:id' => 'suppliers#show'

    post '/users' => 'users#create'

    post '/sessions' => 'sessions#create'

    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'

    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
    delete '/carted_products/:id' => 'carted_products#destroy'
  end
end
