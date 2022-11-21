import sqlite3 as sql
from flask import Flask, render_template, redirect, url_for, request

app = Flask(__name__)

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

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/addrec',methods=['POST'])
def addrec():
    if request.method == 'POST':
        try:
            first_name = request.form['first_name']
            last_name = request.form['last_name']
            email = request.form['email']
            password = request.form['password']

            with sql.connect("database.db") as conn:
                cur = conn.cursor()
                cur.execute("INSERT INTO User (first_name, last_name, email, password, type) VALUES (?,?,?,?,'customer')",(first_name,last_name,email,password))

                conn.commit()
                msg = "You have registered an account successfully"
        except:
                conn.rollback()
                msg = "Register failed"
        finally:
                return render_template("home.html",msg=msg)
                conn.close()




