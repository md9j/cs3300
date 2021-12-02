Rails.application.routes.draw do
  devise_for :users #, controllers: { sessions: 'users/sessions' } # changed 17NOV2021 per https://github.com/heartcombo/devise#getting-started
 root "home#home"  # supplied by devise = ' root to: 'home#index' '
 resources :projects
 root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #devise_for :users, skip: :all

end