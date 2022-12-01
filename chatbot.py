# from flask import Flask, render_template, redirect, url_for, request, flash, session
# from app import bot
# from chatterbot import ChatBot
# from chatterbot.trainers import ListTrainer
# from chatterbot.trainers import ChatterBotCorpusTrainer

# app = Flask(__name__)
# app.config['SECRET_KEY'] = 'Thisissupposedtobesecret!'


# bot = bot 

# #Training own question
# trainer = ListTrainer(bot)

# trainer.train([
#     'homepage',  
#     'Here is the link: http://127.0.0.1:5000/',
#     'search smartphone',  
#     'Here is the link: http://127.0.0.1:5000/smartphone',
#     'function of this application.',  
#     'Able to recommend smartphone to the user',
#     'all smartphone',  
#     'Here is the link: http://127.0.0.1:5000/smartphone',
#     'edit account',  
#     'Here is the link: http://127.0.0.1:5000/edit',
# ])

# #training with corpus
# trainer = ChatterBotCorpusTrainer(bot)
# trainer.train("chatterbot.corpus.english.emotion","chatterbot.corpus.english.computers")
# trainer.train("data/greetings.yml")
# trainer.train("data/smartphone.yml")

# @app.route("/get")
# def get_bot_response():
# 	userText = request.args.get('msg')
# 	return str(bot.get_response(userText))

