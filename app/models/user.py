from system.core.model import Model

class user(Model):
	def __init__(self):
		super(user, self).__init__()
	def fetch_last_user(self):
		fetch_last_query="select * from users order by id desc limit 1"
		added_last=self.db.query_db(fetch_last_query)[0]
		return added_last
	def create_user(self,info):
		pw_hash = self.bcrypt.generate_password_hash(info['password'])
		create_user_query = "INSERT INTO users (firstName, lastName, email, password, created_at, updated_at) VALUES ('{}', '{}','{}','{}',NOW(),NOW())".format(info['firstName'], info['lastName'], info['email'], pw_hash)
		self.db.query_db(create_user_query)
		return self.fetch_last_user()
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

