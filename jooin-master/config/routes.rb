Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'activities#index'


  resources :activities do
    resources :meetings
  end

  resources :twilio, :only => [] do
    collection do
      get :message, as: 'message'
    end
  end


  resources :users, :only => [:update]
  get '/phone' => 'pages#phone'
end
