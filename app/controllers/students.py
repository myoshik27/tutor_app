from system.core.controller import*
class students(Controller):
	def __init__(self,action):
		super(students, self).__init__(action)
		self.load_model('user')
		self.load_model('student')
	def loginPage(self):
		return self.load_view('students/student_login.html')

	def create(self):
		student_info = {
		'firstName':request.form['first_name'],
		'lastName':request.form['last_name'],
		'email':request.form['email'],
		'password':request.form['password']
		}
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
			return redirect('/students/home/'+str(student['student_info']['id']))
		else:
			return redirect('/student_login')
	def home(self,id):
		user_info=self.models['user'].fetch_user_info_id(id)
		session['id']=user_info['id']
		session['firstName']=user_info['firstName']
		return self.load_view('/students/student_home.html')
