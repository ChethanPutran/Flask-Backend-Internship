import requests
import random
import string

latitude = 19.99
longitude = 73.78

def generate_random_data(lat, lon):
        dec_lat = random.random()/100
        dec_lon = random.random()/100
        return ['%.6f'.format(lon+dec_lon),'%.6f'.format(lat+dec_lat)] 

def randStr(chars = string.ascii_uppercase + string.digits, N=10):
	return ''.join(random.choice(chars) for _ in range(N))

for i in range(50):
    lat,lan=generate_random_data(latitude, longitude)

    API_URL = f'http://127.0.0.1:5000/posts?lat={lat}&lon={lan}'
    res = requests.post(API_URL,data={'message':randStr(chars=string.ascii_lowercase,N=50)})
    weather = res.json()
