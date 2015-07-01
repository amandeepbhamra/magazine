Rails.application.routes.draw do
		
  	devise_for :users
	
	resources :articles, only: [] do 
		collection do
			get 'public'
		end
		resources :comments, only: [:new, :create, :destroy]
	end

	resources :users, only: [:show] do 
		resources :articles
	end

	root 'articles#public'
	
end