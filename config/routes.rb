Rails.application.routes.draw do
  root to: "categories#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index, :show]
  resources :items, only: [:new, :create, :show]

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
