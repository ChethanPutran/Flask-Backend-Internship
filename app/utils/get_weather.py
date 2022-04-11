import os
import requests
from dotenv import load_dotenv
load_dotenv()

API_KEY = os.environ.get('API_KEY')

#https://api.openweathermap.org/data/2.5/weather?lat=13.0704497&lon=74.9953195&appid=5e5defe12d4eabacbd8f3fcc854cb171
def get_weather(latitude,longitude):
        API_URL = f'https://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={API_KEY}'
        res = requests.get(API_URL)
        weather = res.json()
        return weather
