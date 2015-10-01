from system.core.controller import*

class tutors(Controller):
	def __init__(self,action):
		super(tutors, self).__init__(action)
		self.load_model('tutor')
		self.load_model('user')
	def loginPage(self):
		# if session:
		# 	if session['tutor_id']:
		# 		return redirect('tutors/tutor_home.html')
		return self.load_view('tutors/tutor_login.html')
	def create(self):
		tutor_info = {
		'firstName':request.form['first_name'],
		'lastName':request.form['last_name'],
		'email':request.form['email'],
		'password':request.form['password']
		}
		last_added = self.models['user'].create_user(tutor_info)
		self.models['tutor'].create(last_added)
		return redirect('/tutors/home/{}'.format(last_added['id']))
	def login(self):
		tutor_info = {
		'email':request.form['login_email'],
		'password':request.form['login_password']
		}
		tutor = self.models['tutor'].login(tutor_info)
		if tutor['status'] == True:
			return redirect('/tutors/home/'+str(tutor['tutor_info']['id']))
		else:
			return redirect('/tutor_login')
	def home(self,id):
		user_info=self.models['user'].fetch_user_info_id(id)
		session['id']=user_info['id']
		session['firstName']=user_info['firstName']
		return self.load_view('/tutors/tutor_home.html')