require 'webrick'

server = WEBrick::HTTPServer.new(Port:8000)

server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

trap('INT') { server.shutdown }
server.start
