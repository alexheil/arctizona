Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms' => 'static_pages#terms'
  get 'about' => 'static_pages#about'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get "sign_out", to: "users/sessions#destroy"
  end

  resources :users, controller: 'users/users', only: :show do
    resource :profile, controller: 'users/profiles', only: [:edit, :update]
    resource :location, controller: 'users/locations', only: [:edit, :update]
    resource :theme, controller: 'users/themes', only: [:edit, :update]
    resources :photo_albums, controller: 'artists/photo_albums', except: :index do
      resources :photos, controller: 'artists/photos', except: :index
    end
  end

  resources :relationships, controller: 'users/relationships', only: [:create, :update, :destroy]

end
