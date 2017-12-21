Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms' => 'static_pages#terms'
  get 'about' => 'static_pages#about'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy'
    get 'sign_in', to: 'users/sessions#new'
    get 'register', to: 'users/registrations#new'
  end

  resources :users, path: '', controller: 'users/users', only: :show do
    resource :profile, controller: 'users/profiles', only: [:edit, :update]
    resource :location, controller: 'users/locations', only: [:edit, :update]
    resource :theme, controller: 'users/themes', only: [:edit, :update]
    resources :albums, controller: 'users/albums', except: :index do
      resources :photos, controller: 'users/photos', except: :index do
        resources :votes, controller: 'users/votes', only: [:create, :destroy]
      end
    end
  end

  resources :relationships, controller: 'users/relationships', only: [:create, :update, :destroy]

end
