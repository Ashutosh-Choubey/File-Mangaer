from flask import Flask, render_template, url_for, request, redirect  
from flask_mysqldb import MySQL 
from werkzeug.utils import secure_filename
import yaml 


app = Flask(__name__)

db = yaml.load(open('db.yaml'))
app.config['MYSQLDB_HOST'] = db['mysql_host']
app.config['MYSQLDB_USER'] = db['mysql_user']
app.config['MYSQLDB_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']
app.config['MYSQL_UPLOAD_FILES'] = db['mysql_fileStored']

ALLOWED_EXTENSIONS = {'pdf', 'img'}
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
    if request.method == 'POST':
        file = request.files['file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['MYSQL_UPLOAD_FILES'], filename))
            return redirect(url_for('upload',filename=filename))

    return render_template('upload.html')

@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

#--------------------------------------------------------TRIAL--------------------------------------------------#
'''
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['MYSQL_UPLOAD_FILES'], filename))
            return redirect(url_for('upload_file',filename=filename))
    return render_template('upload.html')

'''


if __name__ == "__main__":
    app.run(debug=True)
