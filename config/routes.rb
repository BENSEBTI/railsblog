Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
  	resources :comments
  end
  
end
