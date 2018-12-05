Rails.application.routes.draw do

  resources :vehicles do
    resources :bookings, only: [:new, :create, :delete] do
      resources :reviews, only: :create
    end
  end
  resources :profiles, except: :index
  get 'dashboards/mybookings'
  get 'dashboards/myvehicles'
  get 'dashboards/myvehiclestobook'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
