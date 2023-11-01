require 'mongo'
require 'json'

client = Mongo::Client.new('mongodb://localhost:27017/mysupermarket')
collection = client[:supermarket]

# Check if the file path is provided as an argument
if ARGV.empty?
    puts "Usage: ruby import_data.rb <file_path>"
    exit(1)
end
  
file_path = ARGV[0]

json_data = File.read(file_path)

parsed_data = JSON.parse(json_data)

parsed_data.each do |object|
    insertion_result = collection.insert_one(object)
    puts insertion_result.n if insertion_result.n != 1
end

client.close