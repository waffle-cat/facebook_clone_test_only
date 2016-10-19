Rails.application.routes.draw do

	root 'posts#index'

	resources :sessions, only: [:create, :new, :destoy]
	get '/signup', to: 'users#new'
	get '/signout', to: 'sessions#destroy'
	get '/login', to: 'sessions#new'

	resources :users
	resources :statuses
	resources :sessions
	resources :likes
	resources :welcome, only: :index

end
