Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmT

  root "login#authenticate"
  resources :users

  match '/login', to: 'login#authenticate', via: [:get, :post]

end
