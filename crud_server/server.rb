require 'webrick'
require 'mongo'

server = WEBrick::HTTPServer.new(Port:8000)


server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def initialize(server)
    super(server)
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
    params = req.query
    collection_name = params['collection']
    collection_name = 'supermarket'
    collection = @client[collection_name]

    update_operation =  { '$set' => {'price' => 1.00} }
    lower_threshold = 200.0
    lt_query = { 'price' => { '$lt' => lower_threshold } }

    query_result = collection.update_many(lt_query, update_operation)

    res.body = "HTTP server received a PUT\n"
  end

  def format_results(results)
    format_results = results.map { |doc| doc.to_json }.join("\n")
    format_results
  end
end

server.mount('/products', MyServlet)

trap('INT') { server.shutdown }
server.start
