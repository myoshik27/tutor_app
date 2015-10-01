"""
    Database Specific Configuration File
"""
""" Put Generic Database Configurations here """
class DBConfig(object):
    """ DB_ON must be True to use the DB! """
    DB_ON = False
    DB_DRIVER = 'mysql'
    DB_ORM = False

""" Put Development Specific Configurations here """
class DevelopmentDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'mydb'
    DB_HOST = 'hello'
    """ unix_socket is used for connecting with MAMP. Take this out if you aren't using MAMP """
    DB_OPTIONS = {
        'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock'
    }

""" Put Staging Specific Configurations here """
class StagingDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'mydb'
    DB_HOST = 'hello'

""" Put Production Specific Configurations here """
class ProductionDBConfig(DBConfig):
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_DATABASE_NAME = 'mydb'
    DB_HOST = 'hello'





# <html>
#     <head>
#         <meta charset="utf-8">
#         <title>Edit Product  | Semi Restful Routes</title>
#         <!-- Latest compiled and minified CSS -->
#         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
#         <!-- Optional theme -->
#         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
#         <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/new.css') }}">
#         <!-- Latest compiled and minified JavaScript -->
#         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
#     </head>
#     <body>
#         <div class="wrapper">
#             <form action="/products/{{edit_product_info[0]['id']}}" method="POST">
#                 <div class="form-group">
#                     <label for="name">Name:</label>
#                     <input type="name" class="form-control" id="name" value="{{edit_product_info[0]['name']}}" name="name">
#                 </div>
#                 <div class="form-group">
#                     <label for="description">Description:</label>
#                     <input type="description" class="form-control" id="description" value="{{edit_product_info[0]['description']}}"name="description">
#                 </div>
#                 <div class="form-group">
#                     <label for="price">Price:</label>
#                     <input type="price" class="form-control" id="price" value="{{edit_product_info[0]['price']}}" name="price">
#                 </div>
#                 <input type="submit" class="btn btn-default" value = "Update"></input>              
#             </form>
#             <p><a href="/products/{{edit_product_info[0]['id']}}">Show</a> | <a href="/products">Back</a></p>
#         </div> <!-- End Wrapper -->
#     </body>
# </html>
