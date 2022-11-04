Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help', as: 'help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/signup', to:'users#show'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy, :edit, :update]
  root 'static_pages#home'
end