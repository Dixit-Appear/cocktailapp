Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :update]
  end
  # resources :ingredients
  resources :doses, only: [:destroy]
end
