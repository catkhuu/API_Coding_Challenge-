Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create, :show, :update]
    end
  end 
end
