Rails.application.routes.draw do
  get 'events/show'
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'events#index'
  resources :events, only: [:index, :show, :new] do
    resources :bookings, only: [:create]
  end
end
