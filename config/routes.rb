Rails.application.routes.draw do
  root "users#index"

  devise_for :users 
  
  resources :patients do
    resources :appointments, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
