from flask import Blueprint
from app.weather.controller import home

weather = Blueprint('weather',__name__)

weather.route('/weather')(home)
 

    