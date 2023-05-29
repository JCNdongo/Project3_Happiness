# Import the dependencies.
import numpy as np
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify, render_template, request, redirect


#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:Project3_Happiness.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(autoload_with=engine)
# Save references to each table
Measurement = Base.classes.measurement
Station = Base.classes.station
# Create our session (link) from Python to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)



#################################################
# Flask Routes
#################################################
@app.route('/')
def index():
    # Connect to the SQLite database
    conn = sqlite3.connect('Project3_Happiness.sqlite')
    cursor = conn.cursor()

    # Fetch data from the database
    cursor.execute('SELECT * FROM Happiness_Factors')
    data = cursor.fetchall()

    # Render the template and pass data to it
    return render_template('index.html', data=data)
