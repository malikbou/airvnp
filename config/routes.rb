Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "venues", to: "venues#index"
  # get "venues/new", to: "venues#new"
  # get "venues/:id", to: "venues#show", as: :venue
  # get "venues/:id/bookings/new", to: "venues/index"

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :destroy]
  end
  get "my_booking", to: "bookings#my_booking"
end
