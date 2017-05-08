Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :roles do
    resources :requests, only: :new
  end
  resources :requests, except: :new do
    post :decline, on: :member
  end
  get 'dashboard' => 'dashboards#show'
  resources :users do
    get :invite, on: :member
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
