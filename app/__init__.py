import os
from flask import Flask
from dotenv import load_dotenv
load_dotenv()



def create_app():
    #Creating the app
    app = Flask(__name__)

    DB_URI = os.environ.get('DATABASE_URI')

    #Making necessary configurations
    app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    #Database creation for the first time
    with app.app_context():
        #Importing models and routes
        from app.posts.models import db,ma
       
        #Adding app to the db
        db.init_app(app)
        ma.init_app(app)

        from app.posts.routes import post
        from app.weather.routes import weather

        
        #Creating tables for the first time
        #db.create_all()

        #Registering blueprints    
        app.register_blueprint(post)
        app.register_blueprint(weather)

        return app



    

    
