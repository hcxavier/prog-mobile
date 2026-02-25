/*
Crie uma classe 'ControleRemoto' com um atributo privado '_volume' (int). Crie um método
para aumentar o volume e outro para diminuir, garantindo que o valor não fique abaixo de 0
ou acima de 100. Implemente um 'getter' para ler o volume atual e teste as alterações no seu
código
 */

void main(){
    var remoteControl = RemoteControl();
    print(remoteControl.getVolume);
    print('Aumentando o volume...');
    remoteControl.increaseVolume(15);
    print(remoteControl.getVolume);
    print('Diminuindo o volume');
    remoteControl.shrinkVolume(41);
    print(remoteControl.getVolume);
}

class RemoteControl
{
    int _volume = 50;
    
    int get getVolume => _volume;

    void increaseVolume(int amount)
    {
        _volume += amount;
        if (_volume > 100) _volume = 100;
    }

    void shrinkVolume(int amount)
    {
        _volume -= amount;
        if (_volume < 0) _volume = 0;
    }
}