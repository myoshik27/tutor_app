from system.core.model import Model

class tutor(Model):
	def __init__(self):
		super(tutor, self).__init__()
	def create(self, info):
		create_tutor_query="insert into tutors (user_id, created_at, updated_at) values ('{}',now(),now())".format(info['id'])
		print create_tutor_query
		self.db.query_db(create_tutor_query)
		return True
	def login(self, info):
		tutor_info_query = "SELECT * FROM tutors left join on users.id=tutors.user_id WHERE email = '{}'".format(info['email'])
		tutor_info = self.db.query_db(tutor_info_query)
		if tutor_info[0]:
			if self.bcrypt.check_password_hash(tutor_info[0]['password'], info['password']):
				print tutor_info[0]
				return {'status':True , 'tutor_info':tutor_info[0]}
			else:
				return {'status':False}
	def update(self):
		# query =
		# self.db.query_db(query)
		pass

	def show(self):
		# query = 
		# self.db.query_db(query)
		pass

	def delete(self):
		# query =
		# self.db.query_db(query)
		pass

