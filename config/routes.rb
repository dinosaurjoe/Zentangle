Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :roles do
    resources :requests
  end
  resources :users do
    post :invite, on: :member
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
