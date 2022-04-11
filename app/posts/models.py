from flask_sqlalchemy import SQLAlchemy
from geoalchemy2.types import Geography
from flask_marshmallow import Marshmallow
from datetime import datetime
from sqlalchemy import text

db = SQLAlchemy()
ma = Marshmallow()


class Post(db.Model):
    #Declaring the db variables
    __tablename__ = 'post'
    id=db.Column(db.Integer,primary_key=True)
    message=db.Column(db.String(120),nullable = False)
    location=db.Column(Geography(geometry_type='POINT',srid=4326),nullable = False)
    created_at = db.Column(db.DateTime, nullable = False, default = datetime.strftime(datetime.today(), "%m/%d/%Y, %H:%M:%S"))
    
    def __init__(self,message,longitude,latitude):
        self.message = message
        self.location = 'POINT(%0.8f %0.8f)' % (float(longitude),float(latitude))

    @classmethod
    def within(self,latitude,longitude,distance):
        attr = '%s.location' % self.__tablename__

        point = 'POINT(%0.8f %0.8f)' % (float(longitude),float(latitude))
        location = "ST_GeographyFromText(E'SRID=4326;%s')" % point
        return text('ST_DWithin(%s,%s,%d)' % (attr,location,distance))
    
class PostSchema(ma.Schema):
    class Meta:
        model = Post
        id = ma.auto_field()
        message = ma.auto_field()
        location = ma.auto_field()
        fields = ("id","message","created_at")

        

    