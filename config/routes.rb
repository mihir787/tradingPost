Rails.application.routes.draw do
  root to: "tradingpost#show"

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:create, :destroy, :index, :show]
    end
  end

end
