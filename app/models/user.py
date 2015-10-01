from system.core.model import Model

class user(Model):
	def __init__(self):
		super(user, self).__init__()
	def create_tutor(self, info):
		pw_hash = self.bcrypt_generate_password_hash(info['password'])
		create_tutor_query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES ('{}', '{}','{}','{}',NOW(),NOW())".format(info['first_name'], info['last_name'], info['email'], pw_hash)
		create_tutor = self.db.query_db(create_tutor_query)
		return True
	def create_student(self, info):
		pw_hash = self.bcrypt.generate_password_hash(info['password'])
		create_student_query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES ('{}', '{}','{}','{}',NOW(),NOW())".format(info['first_name'], info['last_name'], info['email'], pw_hash)
		create_student = self.db.query_db(create_student_query)
		return True
	def login_tutor(self, info):
		tutor_info_query = "SELECT * FROM users WHERE email = '{}'".format(info['email'])
		tutor_info = self.db.query_db(tutor_info_query)
		if tutor_info[0]:
			if self.bcrypt.check_password_hash(tutor_info[0]['password'], info['password'])
				return {'status':True, 'tutor_info'=tutor_info[0]}
			else:
				return {'status':False}
	def login_student(self,info):
		student_info_query = "SELECT * FROM users WHERE email = '{}'".format(info['email'])
		student_info = self.db.query_db(student_info_query)
		if student_info[0]:
			if self.bcrypt.check_password_hash(student_info[0]['password'], info['password'])
				return {'status':True, 'student_info'=student_info[0]}
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