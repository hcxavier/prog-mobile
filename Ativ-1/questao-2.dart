// Utilizando as variáveis do exercício anterior, calcule o valor total do estoque (preço
// *quantidade) e o preço final após aplicar a taxa de imposto (preço + (preço * imposto)).
// Verifique se o estoque é maior que 0 e a preço menor que 100, imprimindo o resultado
// booleano.

void main()
{
    String product = "Gamesir X5-lite";
    double price = 220.00;
    double taxRate = 0.4;
    int stockAmount = 42;
    bool isOnSale = true;

    totalValue(price, stockAmount);
    finalPrice(price, taxRate);
    print('Tem estoque? ${hasStock(stockAmount)}');
    print('É barato? ${isCheap(price)}');
}

void totalValue(double price, int stockAmount)
{
    print("O valor total dos produtos em estoque: R\$${price * stockAmount}");
}

void finalPrice(double price, taxRate)
{
    print("O valor produto com imposto: R\$${price + (price * taxRate)}");
}

bool hasStock(int stockAmount)
{
    if (stockAmount <= 0) return false;

    return true;
}

bool isCheap(double price)
{
    if (price >= 100.00) return false;
    
    return true;
}