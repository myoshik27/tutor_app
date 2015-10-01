from system.core.controller import*

class users(Controller):
	def __init__(self,action):
		super(users, self).__init__(action)
		# self.load_model('user')
	
	def index(self):
		print "Path Index"
		return self.load_view('index.html')

	def create(self):
		pass

	def show(self):
		pass

	def delete(self):
		pass

	def update(self):
		pass