Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'
  # root "articles#index"
  resources :users, only: [:index, :show] do
		resources :posts, only: [:index, :show, :edit]
  end

	get 'posts/new', to: 'posts#new' # post form.
	post 'posts', to:'posts#create' # create a post.
end
