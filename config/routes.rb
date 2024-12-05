Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about'
  devise_for :users
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
end
