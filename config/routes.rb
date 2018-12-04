Rails.application.routes.draw do

  get 'profiles/new'
  get 'profiles/edit'
  resources :vehicles do
    resources :bookings, only: [:create, :delete] do
      resources :reviews, only: :create
    end
  end
  get 'dashboards/mybookings'
  get 'dashboards/myvehicles'
  get 'dashboards/myvehiclestobook'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
