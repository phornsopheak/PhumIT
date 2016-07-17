Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  mount RailsAdmin::Engine => "/adminphumit", as: "rails_admin"
  devise_for :users, path: "", path_names: { sign_in: "@dminphumitlog_in" }
  root "static_page#home"
  get "/about_us", to: "static_page#about_us"
  get "/google8f8e10d7f43bf086", to: "static_page#google8f8e10d7f43bf086"

  resources :categories, only: [:show]
  resources :lists, only: [:show]
  resources :articles, only: [:show, :index]
end
