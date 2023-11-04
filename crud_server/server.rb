require 'webrick'

server = WEBrick::HTTPServer.new(Port:8000)

server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

server.mount_proc '/product' do |req, res|
  if req.request_method == 'POST'
    res.body = "product just hit\n"
  else
    res.status = 405
    res.body = "Method not allowed\n"
  end
end

trap('INT') { server.shutdown }
server.start
