Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :zombies, only: [ :index, :show, :new, :create ]
    end
  end
end
