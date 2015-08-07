Rails.application.routes.draw do
  root to: "index#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index]
  resources :items, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :sessions, only: [:create, :destroy]
      resources :categories, only: [:create, :destroy, :index, :show]
      resources :items, except: [:new]
      resources :trades, except: [:new]
    end
  end

end
