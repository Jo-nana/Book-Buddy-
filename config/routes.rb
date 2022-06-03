Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'component', to: 'pages#component'

  resources :books do
    resources :bookings, only: [:new, :create]
  end

  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:new, :create]
  end
end
