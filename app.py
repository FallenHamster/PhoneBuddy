import sqlite3 as sql
from flask import Flask, render_template, redirect, url_for, request, flash, session
from wtforms import StringField, BooleanField, PasswordField, validators, HiddenField
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
    rating = HiddenField('rating',[validators.DataRequired()])

def get_db_connection():
    conn = sql.connect('database.db')
    conn.row_factory = sql.Row
    return conn

def get_smartphone(smartphone_id):
    conn = get_db_connection()
    smartphone = conn.execute('SELECT * FROM Smartphone WHERE id = ?',
                        (smartphone_id,)).fetchone()
    conn.close()
    return smartphone

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

@app.route('/smartphone', methods = ['GET','POST'])
def smartphone():
    result = request.form.get('search')
    conn = get_db_connection()
    smartphones = conn.execute('SELECT * FROM Smartphone').fetchall()
    if request.method == 'POST':
       smartphones = conn.execute("SELECT * FROM Smartphone WHERE brand = ? OR model = ?",(result,result)).fetchall()
    conn.close()
    return render_template('smartphone.html', smartphones = smartphones)


@app.route('/smartphonedetail/<int:id>',methods = ['GET','POST'])
def smartphonedetail(id):
    if session.get('loggedin') == True:
        smartphone = get_smartphone(id)
        session['smartphoneid'] = id
        userid = session['id']
        conn = get_db_connection()
        reviews = conn.execute('SELECT * FROM Review WHERE smartphoneID = ?',(id,)).fetchall()
        users = conn.execute('SELECT User.first_name,User.last_name FROM User INNER JOIN Review ON User.id = Review.userID AND Review.smartphoneID = ?',(id,)).fetchall()
        data = zip(reviews, users)
        if request.method == 'POST':
            if request.form['favourite'] == 'favourite':
                with sql.connect("database.db") as conn:
                    cur = conn.cursor()
                    cur.execute('INSERT INTO Favourite (userID, smartphoneID) VALUES (?, ?)',(userid[0],id))
                    cur.close()
                    message = "Smartphone has been added to favourite." 
                    flash(message,'Added')
                return render_template('smartphonedetail.html', smartphone = smartphone, data = data)
            return render_template('smartphonedetail.html', smartphone = smartphone, data = data)
        return render_template('smartphonedetail.html',smartphone = smartphone, data = data)
    else:
        message = "Unauthorized Access! Please login to continue."
        flash(message,'InvalidLogin')
        return redirect('/login')

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('id',None)
    session.pop('username',None)
    message = "Visit Us Next Time!!"
    flash(message,"loggedout")
    return redirect(url_for('home'))

@app.route('/edit',methods = ['GET','POST'])
def edit():
    if session.get('loggedin') == True:
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
    else:
        message = "Unauthorized Access! Please login to continue."
        flash(message,'InvalidLogin')
        return redirect('/login')

@app.route('/review', methods = ['GET','POST'])
def review():
    if session.get('loggedin') == True:   
        smartphoneID = session['smartphoneid']
        id = session['id']
        conn = get_db_connection()
        model = conn.execute('SELECT model FROM Smartphone WHERE id = ?',(smartphoneID,)).fetchone()
        form = ReviewForm(request.form)
        if request.method == 'POST' and form.validate():
            with sql.connect("database.db") as conn:
                cur = conn.cursor()
                cur.execute("INSERT INTO Review (title, content, rating, smartphoneID, userID) VALUES (?,?,?,?,?)",(form.title.data, form.content.data, form.rating.data, smartphoneID, id[0]))
                conn.commit()
                message = "Review has been added successfully"
                flash(message,'review')
            return redirect(url_for('smartphone'))
        return render_template('review.html', form = form, model = model)
    else:
        message = "Unauthorized Access! Please login to continue."
        flash(message,'InvalidLogin')
        return redirect('/login')

if __name__ == '__main__':
    app.run(debug = True)



