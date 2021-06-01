Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'users#create'
      post 'login', to: 'users#show'
      get 'get_current_user', to: 'users#get_current_user'
      resources :users, except: [:index, :create, :show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :events, except: [:index, :show]
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
