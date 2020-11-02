# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations',
    invitations: 'clients/invitations'
  }

  resources :clients, only: [:show]
  get 'my_orders', to: 'clients#myorders'
  get 'my_favs', to: 'clients#myfavs'
  get 'my_restaurants', to: 'clients#myrestaurants'
  get 'clients', to: 'clients#index'
  post 'add_plates', to: 'orders#add_plates'
  delete "clients/:id", to: "clients#destroy"
  get 'pendings', to: 'restaurantes#pendings'
  get 'statistics', to: 'admins#show_graphs'

  post 'restaurantes/favourites'
  post 'restaurantes/unfavourites'

  post 'restaurantes/rating'
  post 'restaurantes/delete_rating'
  post 'plates/rating'
  post 'plates/delete_rating'

  post 'restaurant_comments/like'
  post 'restaurant_comments/dislike'
  post 'plate_comments/like'
  post 'plate_comments/dislike'

  post 'restaurantes/accept'
  post 'orders/accept'
  post 'orders/decline'
  post 'orders/cooking'
  post 'orders/delivered'
  post 'orders/sent'


  resources :restaurantes do
      resources :orders
  end

  resources :restaurantes do
    resources :restaurant_comments
    resources :plates do
      resources :plate_comments
    end
  end

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
