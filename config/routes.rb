Rails.application.routes.draw do
  root to: "tradingpost#show"

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :sessions, only: [:create, :destroy]
      resources :categories, only: [:create, :destroy, :index, :show]
      resources :items, except: [:new]
      resources :proposed_trades, except: [:new]
    end
  end

end
