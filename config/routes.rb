Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'users#create'
      post 'login', to: 'sessions#create'
      get 'get_current_user', to: 'sessions#get_current_user'
      delete 'logout', to: 'sessions#destroy'
      resources :users, only: [:update, :destroy] do
        resources :events, only: [:create, :update, :destroy] do
          resources :guests, only: [:create, :update, :destroy]
        end
      end
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
