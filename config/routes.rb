Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :zombies, only: [ :index, :show, :create, :update, :destroy ]
      resources :weapons, only: [ :index, :create, :update, :destroy ]
      resources :armors, only: [ :index, :create, :update, :destroy ]
    end


  end
end
