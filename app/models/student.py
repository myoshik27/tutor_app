from system.core.model import Model

class student(Model):
	def __init__(self):
		super(student, self).__init__()
	def create(self, info):
		create_student_query="insert into students (user_id, created_at, updated_at) values ('{}',now(),now())".format(info['id'])
		self.db.query_db(create_student_query)
		return True
	def login(self,info):
		errors=[]
		student_info_query = "select * FROM students left join users on users.id=students.user_id WHERE email='{}'".format(info['email'])
		student_info = self.db.query_db(student_info_query)
		if student_info:
			if self.bcrypt.check_password_hash(student_info[0]['password'], info['password']):
				return {'status':True, 'student_info':student_info[0]}
		errors.append("Infromation you put in does not match our database")
		return {'status':False, 'errors':errors}