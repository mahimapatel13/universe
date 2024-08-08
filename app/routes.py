from app import app
from flask import render_template, flash, redirect, url_for, request

@app.route('/')
def landing():
    return render_template('index.html')