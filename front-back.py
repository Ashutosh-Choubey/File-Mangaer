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
        for i in range(1,19): 
            f = request.form['d{}'.format(i)] #place name of the input field
            f.save(app.config['MYSQL_UPLOAD_FILES']  + file.filename) #uploads is a pre-existing folder which you have to create manually and the file will be saved in that folder only.
            redirect('/home')
    return render_template('upload.html')

@app.route('/my_redirect')
def my_redirect():
    return redirect(url_for('upload',_anchor='upload_files'))

@app.route('/search', methods=['GET', 'POST'])
def search_results(search):
    results = []
    search_string = search.data['search']
    if search_string:
        if search.data['select'] == 'Artist':
            qry = db_session.query(Album, Artist).filter(
                Artist.id==Album.artist_id).filter(
                    Artist.name.contains(search_string))
            results = [item[0] for item in qry.all()]
        elif search.data['select'] == 'Album':
            qry = db_session.query(Album).filter(
                Album.title.contains(search_string))
            results = qry.all()
        elif search.data['select'] == 'Publisher':
            qry = db_session.query(Album).filter(
                Album.publisher.contains(search_string))
            results = qry.all()
        else:
            qry = db_session.query(Album)
            results = qry.all()
    else:
        qry = db_session.query(Album)
        results = qry.all()
    if not results:
        flash('No results found!')
        return redirect('/')    
    else:
        # display results
        table = Results(results)
        table.border = True
        return render_template('results.html', table=table)



if __name__ == "__main__":
    app.run(debug=True)
