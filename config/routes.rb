Rails.application.routes.draw do
  root to: "tradingpost#show"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :show]  #show == user dashboard,  #new == user registration
  resources :categories, only: [:index]  #index == homepage
  resources :items, only: [:new] #new == new item form

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
