Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmT

  root "login#authenticate"
  resources :users, except: [:new]
   get '/signup', to: 'users#new'

  match '/login', to: 'login#authenticate', via: [:get, :post]

end
