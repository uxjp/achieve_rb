require 'mongo'

client = Mongo::Client.new('mongodb://localhost:27017/mysupermarket')
collection = client[:supermarket]

query = { 'name' => 'Rice' }

# Define the update operation using the $set operator
update_operation =  { '$set' => {'price' => 1.45} }

result_from_update_one = collection.update_one(query, update_operation)

if result_from_update_one.matched_count > 0
    puts "Bean updated successfully."
else
    puts "No documents matched in query."
end

lower_threshold = 5.0
lt_query = { 'price' => { '$lt' => lower_threshold } }

result = collection.update_many(lt_query, update_operation)

if result.matched_count > 0
  puts "#{result.matched_count} documents updated successfully."
else
  puts "No documents matched in the query."
end

client.close