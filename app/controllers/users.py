from system.core.controller import*
from flask import request, Flask, session, Markup
import re
from flask.ext.bcrypt import Bcrypt

class users(Controller):
	def __init__(self,action):
		super(users, self).__init__(action)
		# self.load_model('user')
	
	def index(self):
		print "Path Index"
		return self.load_view('users/index.html')
	def tutor_login(self):
		return self.load_view('users/tutor_login.html')
	def student_login(self):
		return self.load_view('users/student_login.html')

	def tutor_create(self):
		tutor_info = request.form
		tutor = self.models['user'].create_tutor(tutor_info)
		return redirect('/tutor_login')
	def student_create(self):
		student_info = request.form
		student = self.models['user'].create_student(student_info)
		return redirect('/student_login')
	def tutor_login(self):
		tutor_info = request.form
		tutor = self.models['user'].login_tutor(tutor_info)
		if tutor['status'] == True:
			session['id'] = tutor['tutor_info']['id']
			session['first_name'] = tutor['tutor_info']['first_name']
			return redirect('/tutor_home/'+str(tutor['tutor_info']['id']))
		else:
			return redirect('/tutor_login')
		
	def student_login(self):
		student_info = request.form
		student = self.models['user'].login_student(student_info)
		if student['status'] == True:
			session['id'] = student['student_info']['id']
			session['first_name'] = student['student_info']['first_name']
			return redirect('/student_home/'+str(student['student_info']['id']))
		else:
			return redirect('/student_login')
	def tutor_home(self):
		return self.load_view('/users/tutor_home.html')
	def student_home(self):
		return self.load_view('/users/student_home.html')

	def delete(self):
		pass

	def update(self):
		pass