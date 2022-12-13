import sqlite3 as sql
from flask import Flask, render_template, redirect, url_for, request, flash, session
from wtforms import StringField, BooleanField, PasswordField, validators, IntegerField
from flask_wtf import Form
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import LoginManager

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Thisissupposedtobesecret!'
#login_manager = LoginManager()
#login_manager.init_app(app)

class UserForm(Form):
    first_name = StringField('first_name',[validators.DataRequired()])
    last_name = StringField('last_name',[validators.DataRequired()])
    email = StringField('email',[validators.DataRequired()])
    password = PasswordField('password',[validators.Length(min = 6), validators.DataRequired(), validators.EqualTo('password_confirmation', message = 'Password Must Match')])
    password_confirmation = PasswordField('password_confirmation',[validators.DataRequired()])

class LoginForm(Form):
    email = StringField('email',[validators.DataRequired()])
    password = PasswordField('password',[validators.DataRequired(),validators.Length(min = 6)])

class EditForm(Form):
    first_name = StringField('first_name',[validators.DataRequired()])
    last_name = StringField('last_name',[validators.DataRequired()])
    email = StringField('email',[validators.DataRequired()])
    password = PasswordField('password',[validators.Length(min = 6), validators.DataRequired(), validators.EqualTo('password_confirmation', message = 'Password Must Match')])
    password_confirmation = PasswordField('password_confirmation',[validators.DataRequired()])

class ReviewForm(Form):
    title = StringField('title',[validators.DataRequired()])
    content = StringField('content',[validators.DataRequired()])
    #rating = 

class addSmartphoneForm(Form):
    brand = StringField('brand',[validators.DataRequired()])
    model = StringField('model',[validators.DataRequired()])
    processor = StringField('processor',[validators.DataRequired()])
    ram = StringField('ram',[validators.DataRequired()])
    colour = StringField('colour',[validators.DataRequired()])
    battery = StringField('battery',[validators.DataRequired()])
    lowprice = IntegerField('lowprice',[validators.DataRequired()])
    highprice = IntegerField('highprice',[validators.DataRequired()])
    screenSize = StringField('screenSize',[validators.DataRequired()])
    refreshRate = StringField('refreshRate',[validators.DataRequired()])
    description = StringField('description',[validators.DataRequired()])
    
  

def get_db_connection():
    conn = sql.connect('database.db')
    conn.row_factory = sql.Row
    return conn

def convertToBinaryData(filename):
    # Convert digital data to binary format
    with open(filename, 'rb') as file:
        blobData = file.read()
    return blobData



@app.route('/')
def home():
    #If not loggedin, then redirect to login page
    #if session.get('loggedin') == False:
        #return redirect('/login')
    return render_template('home.html')

@app.route('/login', methods = ['GET','POST'])
def login():
    form = LoginForm(request.form)
    if  request.method == 'POST' and form.validate():
        with sql.connect("database.db") as conn:
            cur = conn.cursor()
            cur.execute("SELECT id FROM User WHERE email = ?",(form.email.data,))
            id = cur.fetchone()
            cur.execute("SELECT first_name FROM User WHERE email = ?",(form.email.data,))
            first_name = cur.fetchone()
            cur.execute("SELECT password FROM USER WHERE email = ?",(form.email.data,))
            pwhash = cur.fetchone()
            if check_password_hash(pwhash[0],form.password.data):
                session ['loggedin'] = True 
                session ['id'] = id
                session ['username'] = first_name
                message = "Welcome to PhoneBuddy!!"
                flash(message,'LoggedIn')
                return render_template('home.html')
            passErr = "Invalid email or password. Please try again!"
            flash(passErr,'passErr')
            session ['loggedin'] = False 
    return render_template('login.html',form = form)

@app.route('/register',methods=['GET','POST'])
def register():
    form = UserForm(request.form)
    if request.method == 'POST' and form.validate():
        hashed_pw = generate_password_hash(form.password.data,"sha256")
        with sql.connect("database.db") as conn:
            cur = conn.cursor()
            cur.execute("INSERT INTO User (first_name, last_name, email, password, type) VALUES (?,?,?,?,'customer')",(form.first_name.data, form.last_name.data, form.email.data, hashed_pw))

            conn.commit()
        registered_user = form.first_name.data + form.last_name.data
        message = registered_user + " " + "has been registered successfully"
        flash(message,'registered')
        return redirect(url_for('login'))
    return render_template('register.html', form = form)


@app.route('/smartphone')
def smartphone():
    conn = get_db_connection()
    smartphones = conn.execute('SELECT * FROM Smartphone').fetchall()
    conn.close()
    return render_template('smartphone.html', smartphones = smartphones)

@app.route('/search',methods = ['GET','POST'])
def search():
    result = request.form.get('search')
    conn = get_db_connection()
    searchsmartphones = conn.execute("SELECT * FROM Smartphone WHERE brand = ? OR model = ?",(result,result)).fetchall()
    return render_template('smartphone.html',searchsmartphones = searchsmartphones)
    

@app.route('/smartphonedetail')
def smartphonedetail():
    return render_template('smartphonedetail.html')

@app.route('/favourite')
def favourite():
    return render_template('favourite.html')

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('id',None)
    session.pop('username',None)
    message = "Visit Us Next Time!!"
    flash(message,"loggedout")
    return redirect(url_for('home'))

@app.route('/review')
def review():
    #smartphoneID = session['smartphoneID']
    #id = session['id']
    form = ReviewForm(request.form)
    if request.method == 'POST' and form.validate():
        with sql.connect("database.db") as conn:
            #cur = conn.cursor()
            #cur.execute("INSERT INTO Review (Title, Content, rating, smartphoneid, userid) VALUES (?,?,?,?,?)",(form.title.data, form.content.data, form.rating.data, smartphoneId[0], id[0]))
            conn.commit()
            conn.close()
            message = "Review has been added successfully"
            flash(message,'review')
        return redirect(url_for('smartphone'))
    return render_template('review.html', form = form)

@app.route('/edit',methods = ['GET','POST'])
def edit():
    id = session['id']
    conn = get_db_connection()
    users = conn.execute('SELECT * FROM User WHERE id = ?',(id)).fetchall()

    form = EditForm(request.form)
    if request.method == 'POST' and form.validate():
        hashed_pw = generate_password_hash(form.password.data,"sha256")
        conn.execute('UPDATE User SET first_name = ?,last_name = ?,email = ?, password = ? WHERE id = ?',(form.first_name.data, form.last_name.data, form.email.data, hashed_pw,  id[0]))
        conn.commit()
        conn.close()
        message = "Account detail has been modified successfully"
        flash(message,'edited')
        return redirect(url_for('edit'))
    return render_template('edit.html',users = users, form = form)

@app.route('/addSmartphone',methods=['GET','POST'])
def addSmartphone():
    form = addSmartphoneForm(request.form)
    if request.method == 'POST' and form.validate():
        with sql.connect("database.db") as conn:
            cur = conn.cursor()
            cur.execute("INSERT INTO Smartphone (brand, model, processor, ram, colour, battery, lowprice, highprice, screenSize, refreshRate, description, image_URL) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",(form.brand.data, form.model.data, form.processor.data, form.ram.data, form.colour.data, form.battery.data, form.lowprice.data, form.highprice.data, form.screenSize.data, form.refreshRate.data, form.description.data, form.image_URL.data ))

            conn.commit()
        message =  "New Smartphone has been added successfully"
        flash(message,'registered')
        return redirect(url_for('manageSmartphone'))
    return render_template('addSmartphone.html', form = form)


@app.route('/editSmartphone',methods = ['GET','POST'])
def edit():
    id = session['smartphoneID']
    conn = get_db_connection()
    smartphones = conn.execute('SELECT * FROM Smartphone WHERE id = ?',(id)).fetchall()

    form = addSmartphoneForm(request.form)
    if request.method == 'POST' and form.validate():
        
        conn.execute('UPDATE Smartphone SET brand = ?,model = ?,processor = ?, ram = ?, colour = ?, battery = ?, lowprice = ?, highprice = ?, screenSize = ?, refreshRate = ?, description = ?, 
image_URL = ? WHERE id = ?',(form.brand.data, form.model.data, form.processor.data, form.ram.data, form.colour.data, form.battery.data, form.lowprice.data, form.highprice.data, form.screenSize.data, form.refreshRate.data, form.description.data, form.image_URL.data,id[0]))
        conn.commit()
        conn.close()
        message = "Smartphone detail has been modified successfully"
        flash(message,'edited')
        return redirect(url_for('edit'))
    return render_template('edit.html',smartphones = smartphones, form = form)

    
if __name__ == '__main__':
    app.run(debug = True)



