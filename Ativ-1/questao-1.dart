// Crie um programa que declare variáveis para armazenar o nome de um produto (String), seu
// preço (double), a quantidade em estoque (int) e se ele está disponível para venda (bool).
// Imprima todos os valores.

void main()
{
    String product = "Gamesir X5-lite";
    double price = 220.00;
    int stockAmount = 42;
    bool isOnSale = true;


    print('Nome do Produto: ${product}\nPreço: ${price}\nQuantidade em Estoque: ${stockAmount}');

    if (!isOnSale){
        print('Status: Não está à venda');
        return;
    }

    print('Status: Está à venda');
}