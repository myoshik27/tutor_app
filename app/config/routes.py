
from system.core.router import routes

routes['default_controller'] = 'users'
routes['/tutor_login'] = 'users#tutor_login'
routes['/student_login'] = 'users#student_login'
routes['POST']['/tutor_create'] = 'users#tutor_create'
routes['POST']['/student_create'] = 'users#student_create'
routes['POST']['/tutor_login'] = 'user#tutor_login'
# routes['POST']['/student_login'] = 'user#student_login'
# routes['/tutor/home/<id>'] = 'user#tutor_home'
# routes['/student/home/<id>'] = 'user#student_home'

"""
	routes['GET']['/users'] = 'users#index'
	routes['GET']['/users/new'] = 'users#new' -- not necessary for this project because we have index as our new user page
	routes['POST']['/users'] = 'users#create' 
	routes['GET']['/users/<int:id>'] = 'users#show'
	routes['GET']['/users/<int:id>/edit' = 'users#edit'
	routes['PATCH']['/users/<int:id>'] = 'users#update'
	routes['DELETE']['/users/<int:id>'] = 'users#destroy'
"""
