Rails.application.routes.draw do
  get 'books/new'
  get 'books/create'
  get 'books/index'
  get 'books/show'
  get 'books/destroy'
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
