db.createCollection('supermercado');

db.supermercado.insertMany([
  {
    nome: 'Arroz',
    preco: 5.99,
    imagem: 'https://exemplo.com/imagem/arroz.jpg'
  },
  {
    nome: 'Feijão',
    preco: 3.49,
    imagem: 'https://exemplo.com/imagem/feijao.jpg'
  },
  {
    nome: 'Leite',
    preco: 2.99,
    imagem: 'https://exemplo.com/imagem/leite.jpg'
  },
  {
    nome: 'Pão',
    preco: 2.49,
    imagem: 'https://exemplo.com/imagem/pao.jpg'
  },
  {
    nome: 'Ovos',
    preco: 4.29,
    imagem: 'https://exemplo.com/imagem/ovos.jpg'
  },
  {
    nome: 'Carne Moída',
    preco: 12.99,
    imagem: 'https://exemplo.com/imagem/carne.jpg'
  },
  {
    nome: 'Cerveja',
    preco: 7.99,
    imagem: 'https://exemplo.com/imagem/cerveja.jpg'
  },
  {
    nome: 'Macarrão',
    preco: 1.99,
    imagem: 'https://exemplo.com/imagem/macarrao.jpg'
  },
  {
    nome: 'Sabonete',
    preco: 1.49,
    imagem: 'https://exemplo.com/imagem/sabonete.jpg'
  },
  {
    nome: 'Detergente',
    preco: 1.29,
    imagem: 'https://exemplo.com/imagem/detergente.jpg'
  }
]);