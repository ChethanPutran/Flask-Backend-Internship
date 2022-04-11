## Enabling postgis extension

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

## Routes

1. GET REQUESTS

i) GET WEATHER
http://{host}:{port}/weather?lat={latitude}&lon={longitude}&page={page_num}

Eg:
http://127.0.0.1:5000/posts?lat=14.0304491&lon=75.5953181&page=1

ii) GET POSTS
http://{host}:{port}/posts?lat={latitude}&lon={longitude}

Eg:
http://127.0.0.1:5000/posts?lat=14.0304491&lon=75.5953181&page=1

2. POST REQUESTS
   i) POST POSTS
   http://{host}:{port}/posts?lat={latitude}&lon={longitude}

    ->with form field : message = 'something...'

Eg:
http://127.0.0.1:5000/posts?lat=14.0304491&lon=75.5953181
