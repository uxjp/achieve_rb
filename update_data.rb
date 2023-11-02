require 'mongo'

client = Mongo::Client.new('mongodb://localhost:27017/mysupermarket')
collection = client[:supermarket]

query = { 'name' => 'Rice' }

# Define the update operation using the $set operator
updateOperation =  { '$set' => {'price' => 123.45} }

result = collection.update_one(query, updateOperation)

if result.matched_count > 0
    puts "Bean updated successfully."
else
    puts "No documents matched in query."
end

client.close