Rails.application.routes.draw do

	root 'welcome#index'	
  	get 'welcome/index'
 
  	resources :articles do		#um 'article' has_many 'comments'
  		resources :comments
  	end
 
  
end
