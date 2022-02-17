Rails.application.routes.draw do
  root to: 'home#index'

  resources :species

  resources :garden_beds do
    get :propagate_weeds
  end

  resources :plants do
    post :weed
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
