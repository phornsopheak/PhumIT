Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "static_page#home"

  resources :categories
  resources :lists
  resources :articles
end
