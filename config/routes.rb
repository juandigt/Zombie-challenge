Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :armors, only: [ :index, :create, :update, :destroy ]
      resources :weapons, only: [ :index, :create, :update, :destroy ]
      resources :zombies, only: [ :index, :show, :create, :update, :destroy ] do
        member do
          post 'add_armor', to: 'zombies#add_armor', as: 'add_armor'
          post 'add_weapon', to: 'zombies#add_weapon', as: 'add_weapon'
          post 'remove_armor', to: 'zombies#remove_armor', as: 'remove_armor'
          post 'remove_weapon', to: 'zombies#remove_weapon', as: 'remove_weapon'
        end
      end
    end
  end
end
