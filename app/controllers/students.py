from system.core.controller import*
class students(Controller):
	def __init__(self,action):
		super(students, self).__init__(action)
		self.load_model('user')
		self.load_model('student')
	def loginPage(self):
		if session:
			if 'status' in session:
				if session['status']:
					if session['status'] == "student":
						return redirect('/students/home/{}'.format(session['id']))
		return self.load_view('students/student_login.html')
	def create(self):
		student_info = {
		'firstName':request.form['first_name'],
		'lastName':request.form['last_name'],
		'email':request.form['email'],
		'password':request.form['password']
		}
		print student_info
		validation=self.models['user'].validation(student_info,"students")
		if validation['status'] == False:
			for error in validation['errors']:
				flash(error)
			return redirect('/students/loginPage')
		last_added = self.models['user'].create_user(student_info)
		self.models['student'].create(last_added)
		return redirect('/students/home/{}'.format(last_added['id']))
	def login(self):
		student_info = {
		'email':request.form['login_email'],
		'password':request.form['login_password']
		}
		student = self.models['student'].login(student_info)
		if student['status'] == True:
			session['id']=student['student_info']['id']
			session['firstName']=student['student_info']['firstName']
			session['status']="student"
			return redirect('/students/home/'+str(student['student_info']['id']))
		for error in student['errors']:
			flash(error)
		return redirect('/students/loginPage')
	def home(self,id):
		print id
		user_info=self.models['user'].fetch_user_info_id_status(id,"students")
		if user_info == False:
			flash("You are not logged in as a student")
			return redirect('/students/loginPage')
		return self.load_view('/students/student_home.html')
	def profile(self,id):
		student=self.models['user'].fetch_user_info_id_status(id,"students")
		if student == False:
			flash("You are not logged in as a student")
			return redirect('/students/loginPage')
		return self.load_view('/students/student_profile.html', student=student)
	def request(self, id):
		user_id = id
		tutor_info = self.models['user'].fetch_tutor_info(user_id)
		return self.load_view('/students/tutor_request.html', tutor_info=tutor_info, id=id)


