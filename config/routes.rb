Rails.application.routes.draw do
  get 'tag/show'

  get 'sessions/new'

  root              		'static_pages#home'
  get 		'about'  	=>  'static_pages#about'
  get 		'help'    	=>  'static_pages#help'
  get 		'contact' 	=>  'static_pages#contact'
  get 		'signup'  	=>  'users#new'
  get 		'login'		=>	'sessions#new'
  post 		'login'		=>	'sessions#create'
  delete 	'logout'	=>	'sessions#destroy'
  resources :users
  resources :posts
  resources :tags,  only: [:show]

end
