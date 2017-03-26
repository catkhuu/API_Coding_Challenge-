Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      scope 'requests' do
        post '/menus', to: 'requests#create_menu'
        put '/menus/:id', to: 'requests#update_menu'
        delete '/menus/:id', to: 'requests#destroy_menu'
        post '/recipes', to: 'requests#create_recipe'
        put '/recipes:id', to: 'requests#update_recipe'
        delete '/recipes/:id', to: 'requests#destroy_recipe'
        post '/menus/:menu_id/recipes', to: 'requests#create_menu_recipe'
        delete '/menus/:menu_id/recipes/:id', to: 'requests#destroy_menu_recipe'
      end
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create, :show, :update]
    end
  end
end
