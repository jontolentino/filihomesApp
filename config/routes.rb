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
  delete '/logout' => 'sessions#destroy'

  # edit password routes
  get '/password' => 'passwords#edit', as: 'edit_password'
  patch '/password' =>'passwords#update'






end
