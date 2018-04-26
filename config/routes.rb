Rails.application.routes.draw do

  root to: 'movies#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :movies do
      member do
        post :remove_poster
      end
      resources :reviews, only: :destroy do
        member do
          post :unflag
        end
        collection do
          get :flagged
        end
      end
    end
    resources :reviews, only: :index
    resources :actors
    resources :users , only: [:index, :show]
  end

  resources :actors, only: [:index, :show]
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:create, :update, :destroy] do
      member do
        post :flag
      end
      collection do
        get :show_form
      end
    end
  end
end
