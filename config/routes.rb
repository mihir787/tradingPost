Rails.application.routes.draw do
  root to: "tradingpost#show"

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
end
