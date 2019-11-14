Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'events/show'
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'events#index'
  resources :events, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :update]
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
end
