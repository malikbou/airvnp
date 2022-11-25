Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :destroy]
  end
  get "booking_confirmation/:id", to: "bookings#booking_confirmation", as: :booking_confirmation
  get "my_bookings", to: "bookings#my_bookings"

  get "my_venues", to: "venues#my_venues"
end
