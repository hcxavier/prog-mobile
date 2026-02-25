/* 
Crie uma classe chamada 'Usuario' com os atributos 'login' e 'senha'. Implemente um
construtor padrão que inicialize esses atributos. No método 'main', instancie dois objetos
dessa classe com valores diferentes e imprima o login de cada um.
*/

void main()
{
    var userOne = User('proxjie','teste123');
    var userTwo = User('bebel', 'teste123');

    print('--- Usuário 1 ---\n');
    print('Login: ${userOne.login}');
    print('Senha: ${userOne.password}');

    print('\n--- Usuário 2 ---\n');
    print('Login: ${userTwo.login}');
    print('Senha: ${userTwo.password}');
}

class User
{
    String login;
    String password;

    User(this.login, this.password);
}