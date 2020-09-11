from flask import Flask, render_template, url_for, request, redirect, send_file  
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

        if 'logout' in request.form:
            print('Entered Loop!!!')
            return redirect('/')

    return render_template('home.html', temp_data=temp_data, col_data=col_data)




@app.route('/upload', methods=['GET','POST'])
def upload():

    if request.method == 'POST':
        print('Entered loop')

        for i in range(1,2):
            f = request.files['d{}'.format(i)] 
            f.save('FileUp/'  + 'd{}.pdf'.format(i)) 
        cursor = mysql.connection.cursor()
        mysql.connection.commit()
        cursor.close()  
        return redirect('/home')
    
    return render_template('upload.html')

@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))

@app.route('/my_redirect2')
def my_redirect2():
    return render_template('index.html')


@app.route('/docview', methods=['GET', 'POST'])
def docview():
    with open('/run/media/hrushitj/17446b6e-4537-4fd5-93af-783d2f8754b3/Capstone/File-Mangaer/FileUp/d1.pdf', 'rb') as static_file:
        return send_file(static_file, attachment_filename='/FileUp/d1.pdf')


if __name__ == "__main__":
    app.run(debug=True)
