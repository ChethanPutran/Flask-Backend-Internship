from app.weather.models import Weather
from flask import jsonify,request
from app.utils.format_response import format_response 
from app.utils.get_weather import get_weather 
from app.posts.models import db

# def get_weather(latitude,longitude):
#     try:
#         result = db.session.query(Weather).filter(Weather.location == f'PONIT({latitude} {longitude})').all()
#         return result
#     except Exception as e:
#         print(e)
#         return str(e)

def home():
    try:
        latitude = request.args.get('lat')
        longitude = request.args.get('lon')

        if(not latitude or not longitude):
            raise Exception('Latitude & longitude should be passed!')
        
        weather = get_weather(latitude,longitude)
     
        return jsonify(format_response(data=weather)),200
    except Exception as e:
        print(e)
        return jsonify(format_response(message=str(e))),400