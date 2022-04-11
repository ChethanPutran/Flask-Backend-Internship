from flask import request,jsonify
from app.utils.format_response import format_response
from app.utils.add_location import add_location
from app.posts.models import Post,db
from geoalchemy2 import functions

ITEMS_PER_PAGE = 10

def get_posts(latitude,longitude,page):
    try:
        clause = Post.within(latitude,longitude,distance=10)
        res = db.session.query(Post,functions.ST_AsGeoJSON(Post.location)).filter(clause).paginate(page=int(page),per_page=ITEMS_PER_PAGE).items
        posts = add_location(res)
        return posts
    except Exception as e:
        print(e)
        return str(e)

def create_post(message,latitude,longitude):
    try:
        post=Post(message,longitude,latitude)
        db.session.add(post)
        db.session.commit()
        return True
    except Exception as e:
        print('e s',e)
        return False

def index():
    try:
        latitude = request.args.get('lat')
        longitude = request.args.get('lon')

        if(not latitude or not longitude):
            raise Exception('Latitude & longitude should be passed!')
        
        if request.method == 'POST':
            if not request.form:
                raise Exception('Invalid POST request!')
            message = request.form['message']
            if(not message):
                raise Exception('No message data found!')

            status = create_post(message,latitude,longitude)

            if(status):
                return jsonify(format_response(data='Post created sucessfully')),201

            return jsonify(format_response(message='Something went wrong!')),500
            
        else:
            
            page = request.args.get('page')
            page = int(page) if page else 1
            
            posts = get_posts(latitude,longitude,page)

            if(not posts or type(posts) == str):
                return jsonify(format_response(message='No posts found')),404
                
            return jsonify(format_response(data=posts)),200
    except Exception as e:
        print('e',e)
        return jsonify(format_response(message=str(e))),400


