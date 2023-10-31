require 'mongo'

client = Mongo::Client.new(['localhost:27017'], database: 'mysupermarket')

collection_name = 'supermarket'
collection = client[collection_name]

results = collection.find()

results.each do |doc|
  puts doc
end

client.close