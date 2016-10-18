Rails.application.routes.draw do

	root 'posts#index'

	resources :sessions, only: [:create, :new, :destoy]
	get '/signup', to: 'users#new'
	get '/logout', to: 'sessions#destroy'
	get '/login', to: 'sessions#new'

	resources :users
	resources :statuses
	resources :sessions
	resources :likes

end
