Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/categories' => 'categories#index', as: 'categories_index'
  # get '/:slug' => 'categories#show', as: 'categories_show'
  # get '/:slug/:id' => 'tasks#show_id', as: 'tasks_show_id'
  root 'pages#index'

  # registration routes
  get '/sign_up' => 'registrations#new', as: 'registrations_new'
  post '/sign_up' => 'registrations#create', as: 'registrations_create'

  # session routes / login
  get '/sign_in' => 'sessions#new', as: 'sessions_new_login'
  post '/sign_in' => 'sessions#create', as: 'sessions_create_login'
  delete '/logout' => 'sessions#destroy', as: 'session_destroy'

  # edit password routes
  get '/password' => 'passwords#edit', as: 'edit_password'
  patch '/password' =>'passwords#update'

  # app my listings
  get '/u/:id' => 'my_property_listings#my_listing', as: 'my_listing'
  get '/u/:id/prop/:prop_id' => 'my_property_listings#show_listing', as: 'show_listing'
  get '/u/:id/new-listing' => 'my_property_listings#new_listing', as: 'new_listing'
  post '/create/listing' => 'my_property_listings#create_listing', as: 'create_listing'
  delete '/u/:id/prop/:prop_id' => 'my_property_listings#delete_listing', as: 'delete_listing'
  get '/u/:id/prop/:prop_id/edit' => 'my_property_listings#edit_listing', as: 'edit_listing'
  patch '/u/:id/prop/:prop_id' => 'my_property_listings#patch_listing', as: 'patch_listing'


  # app my status
  get 'u/:id/status' => 'status#index', as: 'status_index'
  get 'u/:id/status/:status_id' => 'status#show', as: 'status_show'





end
