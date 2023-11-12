require 'webrick'
require 'mongo'

server = WEBrick::HTTPServer.new(Port:8000)
mongo_client = Mongo::Client.new(['localhost:27017'], database: 'mysupermarket')

server.mount_proc '/' do |req, res|
  res.body = "Hello, Ruby HTTP server\n"
end

class PatchServlet < WEBrick::HTTPServlet::AbstractServlet
  def initialize(server, mongo_client)
    super(server)
    @client = mongo_client
  end

  def do_PATCH(req, res)
    collection = @client["supermarket"]
    zeroing_price = { '$set' => {'price' => 0.0} }
    results = collection.update_many( {}, zeroing_price)

    res.body = format_results(results)
  end
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
    max = params['max']
    new_price = params['new_price']

    collection = @client[collection_name.to_s]
    update_operation =  { '$set' => {'price' => new_price.to_f } }
    lt_query = { 'price' => { '$lt' => max.to_f } }

    query_result = collection.update_many(lt_query, update_operation)
    res.body = "Updated #{query_result.n} entries.\n"
  end

end

def format_results(results)
  format_results = results.map { |doc| doc.to_json }.join("\n")
  format_results
end

server.mount('/products', MyServlet)
server.mount('/products/patch_all_to_zero', PatchServlet, mongo_client)

trap('INT') { server.shutdown }
server.start
