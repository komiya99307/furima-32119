Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :items, only:[:index, :new, :create, :show, :edit]
     resources :histories, only: [:index, :create]
  end
end
