from http.server import HTTPServer, SimpleHTTPRequestHandler

class CORSRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET,POST, OPTIONS')
        self.send_header('Access-Control-Allow-Private-Network', 'true')

        super().end_headers()

print("Serving PreTeXt with CORS headers on port 8129...")
HTTPServer(('localhost', 8129), CORSRequestHandler).serve_forever()

