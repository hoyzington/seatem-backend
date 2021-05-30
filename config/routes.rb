Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, except: [:index, :show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, except: [:index]
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html