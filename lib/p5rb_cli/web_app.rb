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
    when "/p5editor.js"
      res.body = File.read(File.join(static_root, 'p5editor.js'))
      res.content_type = 'application/javascript'
    when "/p5editor.rb"
      res.body = File.read(File.join(static_root, 'p5editor.rb'))
      res.content_type = 'application/ruby'
    when "/style.css"
      res.body = File.read(File.join(static_root, 'style.css'))
      res.content_type = 'text/css'
    when "/main.rb"
      res.body = File.read(script_file)
      res.content_type = 'application/ruby'
    else
      path = File.join(File.dirname(script_file), req.path)
      if File.exist?(path)
        res.body = File.binread(path)
        res.content_type = case File.extname(path)
          when ".png" then 'image/png'
          else 'application/octet-stream'
        end
      else
        res.body = "Not Found"
        res.status = 404
      end
    end
  end
  trap('INT') { server.shutdown }
  puts "Serving at http://localhost:8000/"
  server.start
end