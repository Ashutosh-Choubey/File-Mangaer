from flask import Flask, render_template, url_for, request, redirect  
from flask_mysqldb import MySQL 
import yaml 


app = Flask(__name__)

db = yaml.load(open('db.yaml'))
app.config['MYSQLDB_HOST'] = db['mysql_host']
app.config['MYSQLDB_USER'] = db['mysql_user']
app.config['MYSQLDB_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']
 
mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        user_details = request.form
        name = user_details['uname']
        password_details = request.form['pass']
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO login_creds (Login_Id, Password) VALUES(%s, %s);",(name, password_details))
        mysql.connection.commit()
        cursor.close()
        return redirect('/home')
    return render_template('index.html')

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/upload', methods=['GET','POST'])
def upload():
    if request.method =='POST':
        upload_material = request.form
        for i in range(1,19):
            file_name = request.form['f{}'.format(i)]
            field_name = request.form['d{}'.format(i)]
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO file_storage (file_name, field_name) VALUES(%s, %s);",(file_name, field_name))
            mysql.connection.commit()
            cursor.close()
    return render_template('upload.html')

@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))

if __name__ == "__main__":
    app.run(debug=True)
