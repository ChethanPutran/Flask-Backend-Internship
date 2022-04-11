def format_response(data=None,message=None):
    response_json = {}
    if data:
        response_json = {'status': 'sucess','data':data}
    else:
        response_json = {'status': 'failure','message':message}
    return response_json