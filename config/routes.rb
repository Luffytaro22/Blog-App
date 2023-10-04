Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	devise_for :users
  # Defines the root path route ("/")
  root to: 'users#index'
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :edit, :new, :create, :update] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :destroy]
    end
  end
end
