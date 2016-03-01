Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
  	resources :comments
  end
  
end
