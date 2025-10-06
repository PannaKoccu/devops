from http.server import HTTPServer, BaseHTTPRequestHandler

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html; charset=utf-8")
        self.end_headers()
        html = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Добро пожаловать</title>
            <style>
                body {
                    background-color: violet;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                    font-family: Arial, sans-serif;
                    font-size: 2.5em;
                    color: white;
                    text-shadow: 1px 1px 2px black;
                }
            </style>
        </head>
        <body>
            <p>Добро пожаловать на сервер</p>
        </body>
        </html>
        """
        self.wfile.write(html.encode('utf-8'))

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 5000), MyHandler)
    print("Сервер запущен на http://localhost:5000")
    server.serve_forever()