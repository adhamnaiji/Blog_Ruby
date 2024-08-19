Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root path
  #root "api/v1/articles#index"
 
  root "articles#index"


  # Articles and comments routes
  resources :articles do
    resources :comments
  end

  # Namespaced API routes
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
end
