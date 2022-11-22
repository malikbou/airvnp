Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "venues", to: "venues#index"

  get "venues/new", to: "venues#new"
  post "venues", to: "venues#create"

  get "venues/:id/edit", to: "venues#edit"
  patch "venues/:id", to: "venues#update"

  get "venues/:id", to: "venues#show", as: :venue
end
