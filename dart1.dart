void main() {
  Produto prod1 = Produto();
  prod1.descricao = 'Café Preto';
  prod1.preco = 10;
  Produto prod2 = Produto();
  prod2.descricao = 'Milho Verde';
  prod2.preco = 5;
  Item item1 = Item();
  item1.quant = 10;
  item1.produto = prod1;
  Item item2 = Item();
  item2.quant = 15;
  item2.produto = prod2;
  Venda venda1 = Venda();
  venda1.data = '08/03/2023';
  venda1.itens = [item1, item2];
  double valorVenda1 = venda1.total();
  print('Venda 1: $valorVenda1');
}

class Venda {
  late String data;
  late List<Item> itens;
  
  double total() {
    double soma = itens.map((item) => item.total()).reduce((v, e) => v + e);
    return soma;
  }
}

class Item {
  late int quant;
  late Produto produto;
  
  double total(){
    double preco = produto.preco;
    return preco*quant;
  }
}

class Produto {
  late String descricao;
  late double preco;
}
