from system.core.controller import*
class users(Controller):
	def __init__(self,action):
		super(users, self).__init__(action)
		self.load_model('user')
	def index(self):
		print "Path Index"
		return self.load_view('users/index.html')
	def delete(self):
		pass
	def update(self):
		pass
	def logout(self):
		session.clear()
		return redirect('/')
	def location(self):
		location={
		'latitude':request.form['latitude'],
		'longitude':request.form['longitude'],
		'id':session['id']
		}
		self.models['user'].locations(location)
		print location
		return "Response server"