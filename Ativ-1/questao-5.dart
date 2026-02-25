/*
Na classe 'Usuario', adicione um construtor nomeado chamado 'convidado'. Esse construtor
não deve receber parâmetros e deve definir o login como "Guest" e a senha como "123456".
Instancie um usuário convidado no 'main'
 */

 void main ()
 {
    var guest = User.guest();

    print('--- Usuário Convidado ---');
    print('Login: ${guest.login}');
    print('Senha: ${guest.password}');
 }

 class User
{
    String login;
    String password;

    User(this.login, this.password);

    User.guest(): login = 'Guest', password = '123456';
}