
from system.core.router import routes

routes['default_controller'] = 'users'

"""
	routes['GET']['/users'] = 'users#index'
	routes['GET']['/users/new'] = 'users#new' -- not necessary for this project because we have index as our new user page
	routes['POST']['/users'] = 'users#create' 
	routes['GET']['/users/<int:id>'] = 'users#show'
	routes['GET']['/users/<int:id>/edit' = 'users#edit'
	routes['PATCH']['/users/<int:id>'] = 'users#update'
	routes['DELETE']['/users/<int:id>'] = 'users#destroy'
"""
