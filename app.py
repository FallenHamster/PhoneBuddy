from flask import Flask, render_template, redirect, url_for

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('Home.html')

@app.route('/Login.html')
def Login():
    return render_template('Login.html')

#@app.route('/Login.html')
#def login():
    #return redirect(url_for('Login.html'))

#@app.route('/')
#def login():
    #return redirect(url_for('Login'))





