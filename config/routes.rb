Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
  	resources :comments
  end
  
end
