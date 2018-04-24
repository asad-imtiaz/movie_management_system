Rails.application.routes.draw do

  root to: 'movies#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :movies do
      member do
        get :remove_poster
      end
    end
    resources :actors
    resources :users , only: [:index, :show]
  end

  resources :actors, only: [:index, :show]
  resources :movies, only: [:index, :show]

end
