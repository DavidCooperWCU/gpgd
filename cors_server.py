from http.server import HTTPServer, SimpleHTTPRequestHandler

class CORSRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        
        self.send_header('Access-Control-Allow-Origin', 'https://runestone.academy')
        self.send_header('Access-Control-Allow-Methods', 'GET, OPTIONS')
        
        self.send_header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept')
        

	# Explicitly allow the browser to access your localhost loopback
        self.send_header('Access-Control-Allow-Private-Network', 'true')
        
        super().end_headers()

    def do_OPTIONS(self):
        # Reply with a success status code for the browser's preflight check
        self.send_response(200, "OK")
        self.end_headers()

print("Serving PreTeXt with CORS headers on port 8129...")
HTTPServer(('localhost', 8129), CORSRequestHandler).serve_forever()

