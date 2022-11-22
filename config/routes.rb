Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "venues", to: "venues#index"
  get "venues/new", to: "venues#new"
  get "venues/:id", to: "venues#show"
end
