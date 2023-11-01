require 'mongo'
require 'json'

client = Mongo::Client.new('mongodb://localhost:27017/mysupermarket')
collection = client[:supermarket]

# Check if the file path is provided as an argument
if ARGV.empty?
    puts "Usage: ruby import_data.rb <file_path>"
    exit(1)
end
  
# Extract the file path from the command line argument
file_path = ARGV[0]

File.open(file_path, 'r') do |file|
    file.each_line do |line|
        puts line
    end
end

json_data = File.read(file_path)

# Parse the JSON data
parsed_data = JSON.parse(json_data)

oobject = parsed_data[1]
puts JSON.generate(oobject)

insertion_result = collection.insert_one(oobject)

client.close