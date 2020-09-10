from flask import Flask, render_template, url_for, request, redirect  
from flask_mysqldb import MySQL 
import yaml 


app = Flask(__name__)

db = yaml.load(open('db.yaml'))
app.config['MYSQLDB_HOST'] = db['mysql_host']
app.config['MYSQLDB_USER'] = db['mysql_user']
app.config['MYSQLDB_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']
app.config['MYSQL_UPLOAD_FILES'] = db['mysql_fileStored']

mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        user_details = request.form
        name = user_details['uname']
        password_details = request.form['pass']
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT pass from accounts where userid = %s;"%(name))
        passw = cursor.fetchall()
        print(passw[0][0])
        if password_details == passw[0][0]:
            print("SUCCESS")
            return redirect('/home')
        cursor.close()
    return render_template('index.html')



@app.route('/home', methods=['GET', 'POST'])
def home():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * from imports')
    temp_data = cursor.fetchall()
    cursor.execute('SHOW COLUMNS FROM imports')
    col_data = cursor.fetchall()
    cursor.close() 
    
    if request.method == 'POST':
        if 'search' in request.form:
            print('Entered loop')
            crit_res = request.form['Criteria']
            search_res = request.form['search']
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * from imports WHERE %s like %s'%(crit_res, search_res))
            print(crit_res)
            print(search_res)
            temp_data = cursor.fetchall()
            print(temp_data)
            print(type(temp_data))
            cursor.close()

    return render_template('home.html', temp_data=temp_data, col_data=col_data)




@app.route('/upload', methods=['GET','POST'])
def upload():
    if request.method == 'POST':
        #if 'Upload' in request.form:
        print('Entered loop')
        for i in range(1,3):
            f = request.files['d{}'.format(i)] 
            f.save('FileUp/'  + f.filename) 
        cursor = mysql.connection.cursor()
        mysql.connection.commit()
        cursor.close()  
        return redirect('/home')
    return render_template('upload.html')

@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))

if __name__ == "__main__":
    app.run(debug=True)
