from http.server import HTTPServer, BaseHTTPRequestHandler
import importlib

databaseMoule = importlib.import_module('database')
Database = databaseMoule.Database
database = Database()
database.initDatabase()

class Server(BaseHTTPRequestHandler):
    def do_GET(self):
        """
        Function that processes the GET request sent from the HTML file.
        Args:
            N/A
        Returns:
            N/A. HTTP Response is sent back to the client.
        """
        
        if self.path != '/favicon.ico':
            try:
                queryNumber = int(self.path[2:])
            except:
                queryNumber = 11
            
            responseTuples = database.executeQuery(queryNumber)
            
            responsePElement = ''
            for row in responseTuples:
                for column in row:
                    responsePElement += '<span style="white-space: pre">' + str(column) + '    </span>'
                responsePElement += '<br /><br />'
            
            response = '''
            <!DOCTYPE html>

            <html>
                <head>
                    <title>Query Response</title>
                    <style>
                        .header {{
                            position: fixed;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 5rem;
                            background-color: #8a2b06;
                            color: white;
                            display: flex;
                            align-items: center;
                            padding: 0 10%;
                            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
                            z-index: 10;
                        }}

                        #heading {{
                            position: relative;
                            left: 600px;
                            font-size: 30px;
                        }}
                    </style>
                </head>
                <body>
                    <div class=\"header\">
                        <div id=\"heading\">Query Response</div>
                    </div>
                    
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    
                    {}
                </body>
            </html>
            '''.format(responsePElement)

            self.send_response(200)
            self.end_headers()
            self.wfile.write(response.encode())

httpServer = HTTPServer(('localhost', 8080), Server)
print('Server Started')
httpServer.serve_forever()