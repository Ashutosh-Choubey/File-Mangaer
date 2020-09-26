import frontback as fb
from wsgiref.simple_server import make_server

def web_app(environment, response):
    status = '200 OK'
    headers = [('Content-type', 'text/html; charset=utf-8')]
    response(status, headers)

    return None

with make_server('', 8000, web_app) as server:
    print('You can find the site at http://127.0.0.1:8000')
    server.serve_forever()