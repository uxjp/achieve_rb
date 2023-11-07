require 'webrick'
require 'mongo'

server = WEBrick::HTTPServer.new(Port:8000)

dog = 'dog au au'


server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def initialize(server, dog)
    super(server)
    @dog = dog
    @client = Mongo::Client.new(['localhost:27017'], database: 'mysupermarket')
  end


  def do_GET(request, response)
    params = request.query
    collection_name = params['collection']

    max_price = params['max_price'].to_f

    collection = @client[collection_name]

    if max_price
      query = { 'price' => { '$lt' => max_price } }
      results = collection.find(query)
    else  
      results = collection.find()
    end

    response.status = 200
    response.body = format_results(results)
  end

  def do_PUT(req, res)
    res.body = "HTTP server received a PUT\n"
  end

  def format_results(results)
    format_results = results.map { |doc| doc.to_json }.join("\n")
    format_results
  end
end

server.mount('/products', MyServlet, dog)

trap('INT') { server.shutdown }
server.start
