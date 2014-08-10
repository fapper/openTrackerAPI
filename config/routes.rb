OpenTracker::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root 'application#index'

  resources :events
  resources :tracks

  resources :users do
    resources :race_sessions, only: [:show, :index, :create, :update] do
      resources :laps, only: [:create] do
        resources :positions, only: [:create]
      end
    end

    collection do
      get 'search'
    end
  end
end
