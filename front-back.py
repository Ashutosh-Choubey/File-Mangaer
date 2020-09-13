from flask import Flask, render_template, url_for, request, redirect, send_file, session, flash  
from flask_mysqldb import MySQL 
import yaml 


app = Flask(__name__)

db = yaml.load(open('db.yaml'))
app.config['MYSQLDB_HOST'] = db['mysql_host']
app.config['MYSQLDB_USER'] = db['mysql_user']
app.config['MYSQLDB_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']
app.config['MYSQL_UPLOAD_FILES'] = db['mysql_fileStored']
app.secret_key = 'jobhitulikhnachaheBongoliMC'
mysql = MySQL(app)



@app.route('/', methods=['GET', 'POST'])
def index():
    check=0
    if request.method == 'POST':
        session.pop('user_id', None)
        user_details = request.form
        name = user_details['uname']
        password_details = request.form['pass']
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT pass from accounts where userid = %s;"%(name))
        passw = cursor.fetchall()
        
        if password_details == passw[0][0]:
            session['user_id'] = name
            print("SUCCESS")
            return redirect(url_for('home'))
        else:
            return redirect('/')
        cursor.close()
    return render_template('index.html')



@app.route('/home', methods=['GET', 'POST'])
def home():
    try:
        if session['user_id']:
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * from imports')
            temp_data = cursor.fetchall()
            cursor.execute('SHOW COLUMNS FROM imports')
            col_data = cursor.fetchall()
            cursor.close() 
            
            if request.method == 'POST':
                if 'search' in request.form:
                    print('Entered loop')
                    try:
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
                    
                    except Exception:
                        flash('Not Found!')

                if 'logout' in request.form:
                    return redirect('/')
                
            return render_template('home.html', temp_data=temp_data, current_view = 'Pending')   
    
    except Exception:
        return redirect('/')


@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))


@app.route('/upload', methods=['GET','POST'])
def upload():
    try:
        if session['user_id']:
            if request.method == 'POST':
                
                for i in range(1,25):
                    print('Entered 1 '+ str(i))
                    print(f"d{i:02d}")
                    f = request.files[f"d{i:02d}"]

                    print('Entered 2 '+str(i))
                    if f.filename == '':
                        print('Entered 3 '+str(i))
                        continue
                    f.save(f"FileUp/d{i:02d}.pdf")
                    print('Entered 4 '+str(i))
                    cursor = mysql.connection.cursor()
                    mysql.connection.commit()
                    cursor.close()  
                return redirect('/home')
        else:
            return redirect('/')
        return render_template('upload.html')
        
        
    except Exception as e:
            print(e)
            return redirect('/home')




@app.route('/docview', methods=['GET', 'POST'])
def docview():
    for i in range(1,23):
        with open(f'/run/media/hrushitj/17446b6e-4537-4fd5-93af-783d2f8754b3/Capstone/File-Mangaer/FileUp/d{i:02d}.pdf', 'rb') as static_file:
            return send_file(static_file, attachment_filename=f'/FileUp/d{i:02d}.pdf')

@app.route('/status', methods = ['GET', 'POST'])
def status():
    cursor = mysql.connection.cursor()
    stat = request.args.get('my_var', None)
    if stat == '0':
        view = 'Pending'
        cursor.execute('select * from pending'),
        
    elif stat == '1':
        view = 'Delayed'
        cursor.execute('select * from delay'),
    elif stat == '2':
        view = 'Completed'    
        cursor.execute('select * from completed')

    display = cursor.fetchall()
    cursor.close()

    return render_template('home.html', temp_data=display, current_view=view)
    
    


if __name__ == "__main__":
    app.run(debug=True)