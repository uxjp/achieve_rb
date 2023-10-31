require 'mongo'

client = Mongo::Client.new(['localhost:27017'], database: 'mysupermarket')

collection = client['supermarket']

mongo_document = {
    name: 'New Product',
    price: 9.99,
    image: 'www.somelink.com/image_of_new_product.jpg'
}

insertion_result = collection.insert_one(mongo_document)

client.close