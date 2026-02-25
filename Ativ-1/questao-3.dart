// Escreva uma função chamada 'exibirDetalhes' que receba o nome do produto como
// parâmetro posicional e, via parâmetros nomeados, receba o preço (obrigatório com
// 'required') e um desconto opcional (com valor padrão zero). A função deve imprimir os
// dados formatados

void main()
{
    String product = "Gamesir X5-lite";
    double price = 220.00;
    double taxRate = 0.4;
    int stockAmount = 42;
    bool isOnSale = true;

    showDetails(product, price: price, taxRate: taxRate, stockAmount: stockAmount, isOnSale: isOnSale, discount: 0.25);
}

void showDetails(
  String product, {
  required double price,
  double? taxRate,
  int? stockAmount,
  bool? isOnSale,
  double discount = 0.0
  })
{
    print('Nome do Produto: ${product}\nPreço: ${price}\nImposto: ${taxRate}\nQuantidade em Estoque: ${stockAmount}\nDesconto: ${discount * price}\nEstá a venda? ${isOnSale}');
}

