import 'dart:core';

void main() {
  Produto prod1 = Produto(descricao: 'X-tudo', preco:12);
  Produto prod2 = Produto(descricao: 'Batata Frita', preco:7);
  Produto prod3 = Produto(descricao: '1L de cana', preco:15);
  Item item1 = Item(produto:prod1, quant:2);
  Item item2 = Item(produto:prod2, quant:3);
  Item item3 = Item(produto:prod3, quant:1);
  Venda venda = Venda(data:'${DateTime.now()}', itens:[item1, item2, item3]);
  detalhesVenda(venda);
}

void detalhesVenda(Venda venda) {
  print('########################################');
  print('#  D E T A L H E S   D A   V E N D A   #');
  print('########################################');
  print('# Data: ${venda.data}');
  print(venda.itens.map((item) => '# ${item.produto.descricao} (${item.quant}x): R\$ ${item.total()}').reduce((v, e) => '$v \n$e'));
  print("# Total: R\$ ${venda.total()}");
  print('########################################');
}

class Venda {
  String data;
  List<Item> itens;
  
  double total() => itens.map((item) => item.total()).reduce((v, e) => v + e);

  Venda({required this.data, required this.itens});
}

class Item {
  Produto produto;
  int quant;
  
  double total() => quant*produto.preco;

  Item({required this.produto, required this.quant});
}

class Produto {
  String descricao;
  double preco;

  Produto({required this.descricao, required this.preco});
}
