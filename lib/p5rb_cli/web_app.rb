require 'webrick'

def run_web_app(script_file)
  root = File.join(File.dirname(__FILE__), "static")
  server = WEBrick::HTTPServer.new(
    Port: 8000,
    DocumentRoot: root
  )
  trap('INT') { server.shutdown }
  puts "Serving at http://localhost:8000/"
  server.start
end