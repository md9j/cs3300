Rails.application.routes.draw do
  devise_for :user
  resources :projects do
    get 'list', :on => :collection
  end
  root to: 'projects#index'
end