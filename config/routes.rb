Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :planets do
    resources :bookings, only: %i[show new create]
  end

  resources :users, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
