var db = db.getSiblingDB('mysupermarket');

db.createCollection('supermarket');

db.supermarket.insertMany([
  {
    name: 'Rice',
    price: 5.99,
    image: 'https://example.com/image/rice.jpg'
  },
  {
    name: 'Beans',
    price: 3.49,
    image: 'https://example.com/image/beans.jpg'
  },
  {
    name: 'Milk',
    price: 2.99,
    image: 'https://example.com/image/milk.jpg'
  },
  {
    name: 'Bread',
    price: 2.49,
    image: 'https://example.com/image/bread.jpg'
  },
  {
    name: 'Eggs',
    price: 4.29,
    image: 'https://example.com/image/eggs.jpg'
  },
  {
    name: 'Ground Beef',
    price: 12.99,
    image: 'https://example.com/image/beef.jpg'
  },
  {
    name: 'Beer',
    price: 7.99,
    image: 'https://example.com/image/beer.jpg'
  },
  {
    name: 'Pasta',
    price: 1.99,
    image: 'https://example.com/image/pasta.jpg'
  },
  {
    name: 'Soap',
    price: 1.49,
    image: 'https://example.com/image/soap.jpg'
  },
  {
    name: 'Detergent',
    price: 1.29,
    image: 'https://example.com/image/detergent.jpg'
  }
]);