from flask import Flask, render_template, url_for, request, redirect, send_file, session, flash, send_from_directory  
from flask_mysqldb import MySQL 
import yaml 
import os 


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
            session['status'] = 0
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

            if session['status'] == 0:
                view= 'Pending'
                cursor.execute('SELECT * from pending')
                
            elif session['status'] == 1:
                view= 'Delayed'
                cursor.execute('SELECT * from delay')

            elif session['status'] == 2:
                view= 'Completed'
                cursor.execute('SELECT * from completed')
            
            temp_data = cursor.fetchall()
            cursor.execute('SHOW COLUMNS FROM imports')
            col_data = cursor.fetchall()
            cursor.close() 
            
            if request.method == 'POST':
                
                if 'search_b' in request.form:
                    print('Entered loop')
                    try:
                        crit_res = request.form['Criteria']
                        crit_res = crit_res.split(',')
                        print(crit_res[0])
                        search_res = request.form['search']
                        print(search_res)
                        cursor = mysql.connection.cursor()

                        if session['status'] == 0:
                            cursor.execute('SELECT * from pending WHERE %s like \'%s\''%(crit_res[0], search_res))
                            
                        elif session['status'] == 1:
                            cursor.execute('SELECT * from delay WHERE %s like \'%s\''%(crit_res[0], search_res))

                        elif session['status'] == 2:
                            cursor.execute('SELECT * from completed WHERE %s like \'%s\''%(crit_res[0], search_res))
                        
                        temp_data = cursor.fetchall()
                        print(temp_data)
                        cursor.close()
                    
                    except Exception:
                        flash('Not Found!')
                
                if 'sort' in request.form:
                    sorted(temp_data)    
                    
                if 'logout' in request.form:
                    return redirect('/')
                
        return render_template('home.html', temp_data=temp_data, current_view = view, col_data=col_data)   
    
    except Exception:
        return redirect('/')


@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload'))


@app.route('/upload', methods=['GET','POST'])
def upload():
    try:
        if session['user_id']:
            if request.method == 'POST':
                cursor = mysql.connection.cursor()
                data = []
                for i in range(1,23):
                    print(f"d{i:02d}")
                    f = request.files[f"d{i:02d}"]
                    t_data= request.form(f"f{i}")
                    data.append(t_data)
                    if f.filename == '':
                        continue
                    f.save(f"FileUp/d{i:02d}.pdf")
                    mysql.connection.commit()

                    for i in range(23,25):
                        t_data =request.form(f"f{i}")
                        data.append(t_data)

                var_string = ', '.join('?' * len(data))  
                query_s = "INSERT INTO `imports` (eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, \
                                    `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (%s);" % var_string
                cursor.execute(query_s, data)

                cursor.close()  
                return redirect('/home')
        else:
            return redirect('/')
        return render_template('upload.html')
        
        
    except Exception as e:
            print(e)
            return redirect('/home')


@app.route('/docview/', methods=['GET', 'POST'])
def docview():
    try:
        if session['user_id']:
            if request.method == 'POST':
                name = request.form['b1']
                print(name)    
                return send_from_directory('FileUp/', 'd01.pdf')
    
    except Exception:
        return redirect('/')

@app.route('/status', methods = ['GET', 'POST'])
def status():
    try:
        if session['user_id']:
            cursor = mysql.connection.cursor()
            cursor.execute('SHOW COLUMNS FROM imports')
            col_data = cursor.fetchall()
            stat = request.args.get('my_var', None)
            if stat == '0':
                session['status'] = 0
            
            elif stat == '1':
                session['status'] = 1
                
            elif stat == '2':
                session['status'] = 2
                    
            return redirect('/home')
            cursor.close()

            
           # return render_template('home.html', temp_data=display, current_view=view,col_data=col_data) 
    
    except Exception:
        return redirect('/')

@app.route('/sorted', methods=['GET', 'POST'])
def sorting():
    try:
        if session['user_id']:
            try:
                cursor = mysql.connection.cursor()
                cursor.execute('SELECT * from pending')
                temp_data = cursor.fetchall()
                cursor.execute('SHOW COLUMNS FROM imports')
                col_data = cursor.fetchall()

                temp_data=sorted(temp_data)
                return render_template('home.html', temp_data=temp_data, current_view='Pending',col_data=col_data)
            
            except Exception as e:
                print(e)
                
    except Exception:
        return redirect('/')


if __name__ == "__main__":
    app.run(debug=True)