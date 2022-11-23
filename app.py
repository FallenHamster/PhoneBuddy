import sqlite3 as sql
from flask import Flask, render_template, redirect, url_for, request, flash, session
from wtforms import StringField, BooleanField, PasswordField, validators
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

def get_db_connection():
    conn = sql.connect('database.db')
    conn.row_factory = sql.Row
    return conn

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/login', methods = ['GET','POST'])
def login():
    form = LoginForm(request.form)
    if  request.method == 'POST' and form.validate():
        #hashed_pw = check_password_hash(form.password.data,"sha256")
        with sql.connect("database.db") as conn:
            cur = conn.cursor()
            #cur.execute("SELECT * FROM User WHERE email = ? AND password = ?",(form.email.data, hashed_pw))
            #user = cur.fetchall()
            cur.execute("SELECT email FROM User WHERE email = ?",(form.email.data,))
            email = cur.fetchall()
            cur.execute("SELECT password FROM USER WHERE email = ?",(form.email.data,))
            pwhash = cur.fetchone()
            #if len(email) != 1 or not check_password_hash(pwhash[0],form.password.data):
            if check_password_hash(pwhash[0],form.password.data):
                return render_template('home.html')
            #if user:
                #session ['loggedin'] = True
                #session ['id'] = user ['id']
                #session ['username'] = user ['first_name'] + user ['last_name']
                #message = "Login successfully"
                #flash(message,'LoggedIn')
                #return render_template('home.html')
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


def logout():
    session.pop('loggedin',None)
    session.pop('id',None)
    session.pop('username',None)
    return redirect(url_for('/'))

if __name__ == '__main__':
    app.run(debug = True)



