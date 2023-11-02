require 'mongo'

client = Mongo::Client.new('mongodb://localhost:27017/mysupermarket')
collection = client[:supermarket]

name_pattern = /(?=.*e)(?=.*a)/i

query = {
  '$and' => [
    { 'name' => { '$regex' => name_pattern } },
    { 'price' => { '$lt' => 8.0 } }
  ]
}

matching_documents = collection.find(query).to_a
puts "Matching documents: "

matching_documents.each { |doc| puts doc }

delete_result = collection.delete_many(query)

puts "#{delete_result.deleted_count} documents deleted."

client.close
