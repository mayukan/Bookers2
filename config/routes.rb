Rails.application.routes.draw do

  get 'new/index'
  get 'new/show'
  get 'homes/top'
  get "homes/about" => "homes#about"
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
