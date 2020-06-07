Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users  do
    resources :watchlists
  end

  resources :watchlists do
    resources :movies
  end
  resources :movies

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post "/watchlist/sorted", to: 'watchlists#sort_year'

end
