require 'webrick'

def run_web_app(script_file)
  root = File.join(File.dirname(script_file))
  server = WEBrick::HTTPServer.new(
    Port: 8000,
    DocumentRoot: root
  )

  static_root = File.join(File.dirname(__FILE__), "static")
  server.mount_proc '/' do |req, res|
    case req.path
    when "/" || "/index.html"
      res.body = File.read(File.join(static_root, 'index.html'))
      res.content_type = 'text/html'
    when "/main.js"
      res.body = File.read(File.join(static_root, 'main.js'))
      res.content_type = 'application/javascript'
    when "/p5.rb"
      res.body = File.read(File.join(static_root, 'p5.rb'))
      res.content_type = 'application/ruby'
    when "/main.rb"
      res.body = File.read(script_file)
      res.content_type = 'application/ruby'
    else
      res.body = "Not Found"
      res.status = 404
    end
  end
  trap('INT') { server.shutdown }
  puts "Serving at http://localhost:8000/"
  server.start
end