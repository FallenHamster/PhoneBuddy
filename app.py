import sqlite3 as sql
from flask import Flask, render_template, redirect, url_for, request, flash
from wtforms import StringField, BooleanField, PasswordField, validators
from flask_wtf import Form

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Thisissupposedtobesecret!'

class UserForm(Form):
    first_name = StringField('first_name',[validators.DataRequired()])
    last_name = StringField('last_name',[validators.DataRequired()])
    email = StringField('email',[validators.DataRequired()])
    password = PasswordField('password',[validators.Length(min = 6), validators.DataRequired(), validators.EqualTo('password_confirmation', message = 'Password Must Match')])
    password_confirmation = PasswordField('password_confirmation',[validators.DataRequired()])

def get_db_connection():
    conn = sql.connect('database.db')
    conn.row_factory = sql.Row
    return conn

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/header')
def header():
    return render_template('header.html')

@app.route('/footer')
def footer():
    return render_template('footer.html')

@app.route('/base')
def base():
    return render_template('base.html')

@app.route('/register',methods=['GET','POST'])
def register():
    form = UserForm(request.form)
    if request.method == 'POST' and form.validate():
        with sql.connect("database.db") as conn:
            cur = conn.cursor()
            cur.execute("INSERT INTO User (first_name, last_name, email, password, type) VALUES (?,?,?,?,'customer')",(form.first_name.data, form.last_name.data, form.email.data, form.password.data))

            conn.commit()
        flash('You were successfully registered an account')
        return redirect(url_for('login'))
    return render_template('register.html', form = form)

if __name__ == '__main__':
    app.run(debug = True)



