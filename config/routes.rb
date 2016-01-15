Rails.application.routes.draw do
  root "static_page#home"

  resources :categories
  resources :lists
  resources :articles
end
