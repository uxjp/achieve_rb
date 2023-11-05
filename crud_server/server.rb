require 'webrick'

server = WEBrick::HTTPServer.new(Port:8000)

dog = 'dog au au'

puts dog

server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    params = request.query
    database = params['database']
    collection = params['collection']

    puts dog
    response.status = 200
    response.body = "collection #{database} #{collection}"
  end
end

server.mount('/products', MyServlet)

trap('INT') { server.shutdown }
server.start
