from flask import Blueprint
from app.posts.controller import index

post = Blueprint('post',__name__)

post.route('/posts',methods=['GET','POST'])(index)
  
    