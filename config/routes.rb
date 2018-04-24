Rails.application.routes.draw do

  root to: 'movies#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :movies do
      member do
        get :manage_cast
        patch :manage_cast, to: 'movies#update_cast'
        get :remove_poster
      end
    end
    resources :users , only: [:index, :show]
  end

  resources :movies, only: [:index, :show]

end
