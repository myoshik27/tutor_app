from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
class user(Model):
	def __init__(self):
		super(user, self).__init__()
	def fetch_user_info_id(self,id):
		fetch_user_info_id_query="select * from users where id={}".format(id)
		user_info=self.db.query_db(fetch_user_info_id_query)
		return user_info[0]
	def fetch_last_user(self):
		fetch_last_query="select * from users order by id desc limit 1"
		added_last=self.db.query_db(fetch_last_query)[0]
		return added_last
	def create_user(self,info):
		pw_hash = self.bcrypt.generate_password_hash(info['password'])
		create_user_query = "INSERT INTO users (firstName, lastName, email, password, created_at, updated_at) VALUES ('{}', '{}','{}','{}',NOW(),NOW())".format(info['firstName'], info['lastName'], info['email'], pw_hash)
		self.db.query_db(create_user_query)
		return self.fetch_last_user()
	def validation(self,user,status):
		errors=[]
		query_fetch="select * from {} left join users on users.id={}.user_id where email= '{}' limit 1".format(status,status,user['email'])
		if self.db.query_db(query_fetch):
			errors.append("Your Email already exist")
		if len(user['firstName']) < 2 :
			errors.append("Your first name should be longer than 2 characters")
		if len(user['lastName']) < 2 :
			errors.append("Your last name should be longer than 2 characters")
		if len(user['password']) < 8 :
			errors.append("Your password should be longer than 8 characters")
		if len(user['email']) < 2 :
			errors.append("Your email should be longer than 2 characters")
		if not EMAIL_REGEX.match(user['email']):
			errors.append("The email you entered {} is not a valid email address!".format(user['email']))
		if errors:
			return{"status":False, 'errors':errors}
		return {"status":True}
	def locations(self,location):
		fetch="select * from locations where users_id={}".format(location['id'])
		fetch =self.db.query_db(fetch)
		if not fetch:
			init_location_query="insert into locations (longtitude,latitude,created_at, updated_at, users_id) values ('{}','{}',now(),now(),'{}')".format(location['longitude'],location['latitude'],location['id'])
			print init_location_query
			self.db.query_db(init_location_query)
			return "success"
		location_update_query="update locations set longtitude={}, latitude={}, updated_at=now() where users_id={}".format(location['longitude'],location['latitude'],location['id'])
		print location_update_query
		self.db.query_db(location_update_query)
	def get_all_loc(self):
		fetch= "select * from locations JOIN users ON users.id = locations.users_id JOIN tutors ON users.id = tutors.user_id"
		return self.db.query_db(fetch)
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

