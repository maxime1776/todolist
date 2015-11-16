Rails.application.routes.draw do
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get 'add' => 'pages#add'

  resources :users

  resources :spots, only: [:index, :show, :new, :create, :edit, :update] do
    # resources :doses, only: [:new, :create] // pour faire plaisir au rake
    resources :bookings, only: [:index,:new, :create, :show, :edit, :update]
    resources :spot_reviews, only: [:index, :new, :create, :edit, :update, :destroy]

  end
end
