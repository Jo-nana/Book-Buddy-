Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'component', to: 'pages#component'
  get 'dashboard', to: 'pages#dashboard'
  patch '/bookings/:id', to: 'bookings#accept', as: :accept
  patch '/swaps/:id', to: 'bookings#swap', as: :swap
  get '/cancel_booking/:id', to:'pages#cancel_booking', as: :cancel

  resources :books, except: :index do
    resources :bookings, only: [:new, :create]
  end

  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:new, :create]
  end
end
