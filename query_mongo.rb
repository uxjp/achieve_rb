require 'mongo'

client = Mongo::Client.new(['localhost:27017'], database: 'mysupermarket')

collection_name = 'supermarket'
collection = client[collection_name]

results = collection.find()

results.each do |doc|
  puts doc
end

puts "\n> Filtered data\n"

# Define the query criteria
query = { 'price' => { '$lt' => 2.0 } }

results = collection.find(query)

results.each do |doc|
  puts doc
end

client.close