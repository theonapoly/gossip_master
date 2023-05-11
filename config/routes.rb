Rails.application.routes.draw do

  root to: redirect('/gossips')

  get '/welcome/:first_name', to: 'static#welcome'

  get '/contact', to: 'static#contact'

  get '/team', to: 'static#team'

  get '/form', to: 'static#form'

  get '/show_new_gossip/:id', to:'gossips#show_new_gossip'

  resources :cities, only: [:show]

  resources :users, only: [:index, :show]

  resources :gossips do
    resources :comments, except: [:show, :index, :new]
  end
  




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
