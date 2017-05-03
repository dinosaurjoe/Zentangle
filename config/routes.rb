Rails.application.routes.draw do
  resources :projects
  resources :roles
  resources :requests do
    post :decline, on: :member
  end
  get 'dashboard' => 'dashboards#show'
  resources :users do
    post :invite, on: :member
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
