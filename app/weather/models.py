from app.posts.models import db
from geoalchemy2.types import Geometry

class Weather(db.Model):
    #Declaring the db variables
    __tablename__ = 'weather'
    id=db.Column(db.Integer,primary_key=True)
    weather=db.Column(db.PickleType)
    location=db.Column(Geometry(geometry_type='POINT',srid=4326))
    
    def __init__(self,location):
        self.location = f'SRID=4376;POINT({location[0]} {location[1]})'

