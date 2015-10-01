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