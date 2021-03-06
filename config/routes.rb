Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: [:index, :show] do
    resources :bookings, only: [:create, :destroy]
    resources :chatrooms, only: [:index, :show, :create] do
      resources :messages, only: :create
    end
  end
  resources :users, only: [:show]

  get "/dashboard", to: "pages#dashboard"
  get "/test", to: "pages#test"
end
