Rails.application.routes.draw do

  root 'users/homes#top'
  get "/about", to: "users/homes#about"

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  namespace :admins do
    resources :products, only: [:index, :edit, :update]
    get '', to: 'products#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :reviews, only: [:index, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :users do
    resources :buy_lists, only: [:index, :show, :create, :update, :destroy]
    resources :buy_list_products, only: [:create, :update, :destroy]
    resources :products, only: [:new, :index, :show, :edit, :create, :update]
    resources :reviews, only: [:create, :destroy]
    get "search", to: "products#search", as:"products_search"
    resources :users, only: [:show, :edit, :update]
    resources :favorites, only: [:index, :show, :create, :destroy]
  end


end
