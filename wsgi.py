<<<<<<< HEAD
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
=======
from app import app

if __name__ == "__main__":
	app.run()
>>>>>>> 3d687298fa89540993b8af78231abe734a4cd4dc
