Rails.application.routes.draw do
  root to: 'home#index'

  resources :garden_beds
  resources :species

  resources :plants do
    post :weed
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
