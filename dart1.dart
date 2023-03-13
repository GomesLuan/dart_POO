import 'dart:io';
import 'dart:core';

void main() {
  Produto prod1 = Produto();
  prod1.descricao = 'X-Tudo';
  prod1.preco = 12;
  Produto prod2 = Produto();
  prod2.descricao = 'Batata Frita';
  prod2.preco = 7;
  Produto prod3 = Produto();
  prod3.descricao = '1L de Pitu';
  prod3.preco = 15;
  List<Produto> produtos = [prod1, prod2, prod3];
  String? opcao_venda;
  String? opcao_item;
  do {
    List<Item> itens = [];
    do {
      cardapio();
      print("\nEscolha uma opção: ");
      int? prod = int.parse(stdin.readLineSync()!);
      print("Quantas unidades deseja adicionar? ");
      int? quant = int.parse(stdin.readLineSync()!);
      Item item = Item();
      item.produto = produtos[prod-1];
      item.quant = quant;
      print("\nItem adicionado à sacola!");
      itens.add(item);
      print("Quer adicionar mais itens? (s/n): ");
      opcao_item = stdin.readLineSync();
    } while (opcao_item == 's'); 
    Venda venda = Venda();
    venda.data = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    venda.itens = itens;
    detalhesVenda(venda);
    print("\nQuer realizar uma nova venda? (s/n): ");
    opcao_venda = stdin.readLineSync();
  } while (opcao_venda == 's');
}

void cardapio() {
  print('########################################');
  print('#           C A R D Á P I O            #');
  print('########################################');
  print('#     1 - X-Tudo (R\$ 12.00)            #');
  print('#     2 - Batata Frita (R\$ 7.00)       #');
  print('#     3 - 1L de Pitu (R\$ 15.00)        #');
  print('########################################');
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
