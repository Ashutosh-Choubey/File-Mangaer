from flask import Flask, render_template, url_for, request, redirect, send_file, session, flash, send_from_directory  
from flask_mysqldb import MySQL 
import yaml 
import os
from datetime import date


app = Flask(__name__)

#db = yaml.safe_load(open('db.yaml'))
app.config['MYSQLDB_HOST'] = 'localhost'
app.config['MYSQLDB_USER'] = 'root'
app.config['MYSQLDB_PASSWORD'] = 'rootpassword'
app.config['MYSQL_DB'] = 'RBA'
#app.config['MYSQL_UPLOAD_FILES'] = db['mysql_fileStored']
app.secret_key = 'jobhitulikhnachaheBongoliMC'
mysql = MySQL(app)

val = None
state = {'value':val, 'stat':0}
file_fetch = {'eta_date':'d01.pdf',
            'job':'d02.pdf',
            'impname':'d03.pdf',
            'shipper':'d04.pdf',
            'pks':'d05.pdf',
            'invoice_no':'d06.pdf',
            'comm':'d07.pdf',
            'be':'d08.pdf',
            'be_date':'d09.pdf',
            'container_no':'d10.pdf',
            'phyto':'d11.pdf',
            'st_duty':'d12.pdf',
            'yield':'d13.pdf',
            'ship_rec':'d14.pdf',
            'cfs':'d15.pdf',
            'duty_rec':'d16.pdf',
            'pq_rec':'d17.pdf',
            'fssai_rec':'d18.pdf',
            'surv_rec':'d19.pdf',
            'o_rec':'d20.pdf',
            'rba_bill_a':'d21.pdf',
            'rba_bill_b':'d22.pdf'}


@app.route('/', methods=['GET', 'POST'])
def index():
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
            session['sort_data'] = None
            session['is_sort'] = 0
            
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

                if 'logout' in request.form:
                    session['user_id'] = 0
                    return redirect('/')
        
            if session['is_sort'] == 1:
                    session['is_sort'] = 0
                    temp_data = session['sort_data']
            
            status_check = 'unchecked'
            today = date.today().strftime('%d/%m/%Y')

            return render_template('home.html', temp_data=temp_data, current_view = view, col_data=col_data, status_check=status_check, date=today)   
        else:
            return redirect('/')
    
    except Exception as e:
        print(e)
        return redirect('/')


@app.route('/my_redirect')
def my_redirect():
    if session['user_id']:
        return redirect(url_for('upload'))
    else:
        return redirect('/')


@app.route('/upload', methods=['GET','POST'])
def upload():
    try:
        new_imp=[]
        cursor = mysql.connection.cursor()
        if session['user_id']:
            
            cursor.execute("select impname from imp_details order by impname asc;")
            imname = cursor.fetchall()
            for i in imname:
                new_imp.append(i[0])
            if request.method == 'POST':

                if 'logout' in request.form:
                    session['user_id'] = 0
                    return redirect('/')
                
                if 'back' in request.form:
                    return redirect('/home')
            
                if 'addnew' in request.form:
                    return redirect('/addnew')
                
                data_d = {}
                data = []
                cursor.execute('SELECT MAX(srno) from imports;')
                srno = cursor.fetchone()
                
                if srno[0] == 'NULL':
                    srno[0] = 0
                new_srno = srno[0]+1
                os.mkdir('FileUp/'+str(new_srno))
                for i in range(1,24):
                    data.append(None)
                    if (i != 1) and (i != 9) and (i!=3):
                        f = request.files[f"d{i:02d}"]
                        if f.filename == '':
                            continue
                        f.save(f"FileUp/{new_srno}/d{i:02d}.pdf")
                    t_data = request.form['f{}'.format(i)]
                    if (i==1 or i==9 or i==3) and (t_data == ''):
                        t_data = None
                    data_d[i-1]=t_data
                
                for key in data_d:
                    data[key] = data_d[key]
                
                var_string = '%s,'*len(data)
                query_s = "INSERT INTO imports (eta_date, job, impname, shipper, pks, invoice_no, comm, be, be_date, container_no, phyto, st_duty, yield, ship_rec, cfs, duty_rec, pq_rec, fssai_rec, surv_rec, o_rec, rba_bill_a, rba_bill_b) VALUES (%s);"%(var_string[:-1])
                cursor.execute(query_s, data)
                mysql.connection.commit()
                cursor.close()  
                return redirect('/home')
            return render_template('upload.html', new_imp=new_imp)
        
        else:
            return redirect('/')
        
    except Exception as e:
            print(e)
            return redirect('/home')



@app.route('/docview/', methods=['GET', 'POST'])
def docview():
    global file_fetch
    try:
        if session['user_id']:
            if request.method == 'POST':
                db_srno = (request.form['b1']).split('^')[0]
                col = (request.form['b1']).split('^')[1].split(',')[0]
                col_name = file_fetch.get(col)
                
                return send_from_directory(f'FileUp/{db_srno}',col_name)
        else:
            return redirect('/')
    except Exception as e:
        print(e)
        return redirect('/')


@app.route('/docview_kyc', methods=['Get', 'POST'])
def docview_kyc():
    try:
        if session['user_id']:
            if request.method =='POST':
                name = (request.form['b1']).split('+')[0]
                fname = (request.form['b1']).split('+')[1]
                print(name)
                print(fname)
                return send_from_directory(f'FileUp/{name}','{fname}'+'.pdf')
        else:
            return redirect('/')
    except:
        return redirect('/')


@app.route('/status', methods = ['GET', 'POST'])
def status():
    try:
        if session['user_id']:
            stat = request.args.get('my_var', None)
            if stat == '0':
                session['status'] = 0
            
            elif stat == '1':
                session['status'] = 1
                
            elif stat == '2':
                session['status'] = 2
                    
            return redirect('/home')
        else:
            return redirect('/')

    except Exception as e:
        print(e)
        return redirect('/')


@app.route('/sorted', methods=['GET', 'POST'])
def sorted():
    try:
        if session['user_id']:
            if request.method == 'POST':
                global val
                value = request.form['c1']
                value = value.split(',')
                val = value[0]
                state['value'] = val                                     
                cursor = mysql.connection.cursor()
                
                if session['status'] == 0:
                    if state['stat'] == 0:
                        state['stat'] = 1
                        cursor.execute("SELECT * from pending order by %s"%(val))
                    elif state['stat'] == 1:
                        state['stat'] = 0
                        cursor.execute("SELECT * from pending order by %s DESC"%(val))

                if session['status'] == 1:
                    if state['stat'] == 0:
                        state['stat'] = 1
                        cursor.execute("SELECT * from delay order by %s"%(val))
                    else:
                        state['stat'] = 0
                        cursor.execute("SELECT * from delay order by %s DESC"%(val))

                if session['status'] == 2:

                    if state['stat'] == 0:
                        state['stat'] = 1
                        cursor.execute("SELECT * from completed order by %s"%(val))

                    else:
                        state['stat'] = 0
                        cursor.execute("SELECT * from completed order by %s DESC"%(val))

                sort_data = cursor.fetchall()
                session['sort_data'] = sort_data 
                session['is_sort'] = 1
                cursor.close()
                return redirect('/home')
        else:
            return redirect('/')

    except Exception as e:
        print(e)
        return redirect('/')

@app.route('/update', methods=['GET', 'POST'])
def update():
    if session['user_id']:
        if request.method =='POST':
            if request.form.get('b1'):
                check_box = request.form['b1']
                cursor = mysql.connection.cursor()
                cursor.execute("UPDATE imports SET job_status = 1 WHERE srno = %s"%(check_box));
                mysql.connection.commit()
                cursor.close()
            return redirect('/home')
    else:
        return redirect('/')

@app.route('/show_importer', methods=['GET', 'POST'])
def show_importer():
    try:
        message = []
        details = []
        if session['user_id']:
            
            if request.method == 'POST':
                if 'back' in request.form:
                    return redirect('/home')
                
                if 'logout' in request.form:
                    session['user_id'] = 0
                    return redirect('/')

                if 'show' in request.form:
                    mess1 = request.form['mess1']
                    mess2 = request.form['mess2']
                    mess3 = request.form['mess3']
                    mess4 = request.form['mess4']
                    mess5 = request.form['mess5']
                    return render_template('KYC.html', message=[mess1,mess2,mess3,mess4,mess5])
                
                name = (request.form['b1']).split('^')[0].split(',')[0]
                cursor = mysql.connection.cursor()
                cursor.execute("select impname, ic, gst, pan, fssai from imp_details where impname = \'%s\';"%(name))                
                details = cursor.fetchone()
                
                for detail in details:
                    message.append(detail)
                
                
                if 'update' in request.form:
                    return redirect('/update_importer')
            
                
                


            return render_template('KYC.html',message=details)
        else:   
            return redirect('/')

    except Exception as e:
        print(e)
        return redirect('/')

global message1
message1 = []
@app.route('/show_update_importer', methods=['GET','POST'])
def show_update_importer():
    details = []
    data = []
    try:
        cursor = mysql.connection.cursor()    
        if session['user_id']:
            if request.method =='POST':
                if 'edit' in request.form:
                    global impname
                    impname = request.form['edit']
                    cursor.execute("select impname, ic, gst, pan, fssai from imp_details where impname = \'%s\';"%(impname))                
                    details = cursor.fetchone()
                    for detail in details:
                        message1.append(detail)    

                if 'update' in request.form:
                    ic =  request.form['b1']
                    pan = request.form['b2']
                    gst = request.form['b3']
                    lic = request.form['b4']
                    updates = [ic, pan, gst, lic, impname]
                    print(updates)
                    cursor.execute('UPDATE imp_details SET ic = %s, gst = %s, pan = %s, fssai = %s WHERE impname = \'%s\';'%(updates[0],updates[1],updates[2],updates[3],updates[4]))
                    mysql.connection.commit()
                    cursor.close()
                    
                    for i in range(1,5):
                        data.append(None)
                        f = request.files[f"d{i:02d}"]
                        if f.filename == '':
                            continue
                        os.remove(f"Importer_details/{impname}/d{i:02d}.pdf")
                        f.save(f"Importer_details/{impname}/d{i:02d}.pdf")
                        print('After save')
                    return redirect('/home')

                if 'logout' in request.form:
                    session['user_id'] =0 
                    return redirect('/')
                
            return render_template('Update.html', message=message1)
        else:
            return redirect('/')

    except Exception as e:
        print(e)
        return redirect('/')
'''
@app.route('/update_importer', methods=['GET', 'POST'])
def update_importer():
    if session['user_id']:
'''        

@app.route('/addnew', methods=['GET', 'POST'])
def addnew():
    try:
        data = []
        if session['user_id']:
            if request.method == 'POST':
                
                if 'logout' in request.form:
                    session['user_id'] = 0
                    return redirect('/')

                if 'back' in request.form:
                    return redirect('/upload')   
            
                if 'SUBMIT' in request.form:
                    name = request.form['f1']
                    ic = request.form['f2']
                    pan = request.form['f3']
                    gst = request.form['f4']
                    fssa = request.form['f5']
                    cursor = mysql.connection.cursor()
                    cursor.execute("insert into imp_details (impname, ic, gst, pan, fssai) values (\'%s\', \'%s\', \'%s\', \'%s\',\'%s\');"%(name, ic, pan, gst, fssa))
                    mysql.connection.commit()
                    cursor.close()
                    os.mkdir('Importer_details/'+name)
                    
                    for i in range(1,5):
                        print(1)
                        data.append(None)
                        print(2)
                        f = request.files[f"d{i:02d}"]
                        print(3)
                        if f.filename == '':
                            continue
                        print(4)
                        f.save(f"Importer_details/{name}/d{i:02d}.pdf")
                        print(5)
                        print('After save')
                    return redirect('/upload')

            return render_template('addnew.html')
    
        else:
            return redirect('/')
    
    except Exception as e:
        print(e)
        return redirect('/')


if __name__ == "__main__":
        app.run(debug=True)
