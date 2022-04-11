from app.posts.models import PostSchema
from datetime import datetime
import json

def format_date(date):
    curr_time = datetime.now()
    date = datetime.fromisoformat(date)
    diff = abs(date - curr_time)
    seconds = diff.total_seconds()
    if(seconds < 60):
        return 'just now'
    elif(seconds < 120):
        return '1min ago'
    elif(seconds <= 24*60*60):
        return 'today'
    elif(seconds <= 24*60*60*2):
        return 'yesterday'
    elif(seconds < 24*60*60*14):
        return '1 weeek ago'
    elif(seconds < 24*60*60*60):
        return '1 month ago'
    elif(seconds < 24*60*60*90):
        return '2 months ago'
    elif(seconds > 24*60*60*365):
        return '1 year ago'
    
def add_location(result):
    posts = []
    for item in result:
        post_schema = PostSchema()
        post = post_schema.dump(item[0])
        post['location']=json.loads(item[1])['coordinates']
        post['time_stamp']=format_date(post['created_at'])
        posts.append(post)
    return posts