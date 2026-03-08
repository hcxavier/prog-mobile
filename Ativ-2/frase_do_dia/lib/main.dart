import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frase do Dia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FraseDoDia(title: 'Frase do Dia'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FraseDoDia extends StatefulWidget {
  const FraseDoDia({super.key, required this.title});

  final String title;

  @override
  State<FraseDoDia> createState() => _FraseDoDiaState();
}

class _FraseDoDiaState extends State<FraseDoDia> {
  int _fraseAleatoria = 0;
  int _imagemAleatoria = 0;

  final List<String> _frases = [
    "A persistência é o caminho do êxito.",
    "As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.",
    "Motivação é a arte de fazer as pessoas fazerem o que você quer que elas façam porque elas o querem fazer.",
    "Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.",
    "No meio da dificuldade encontra-se a oportunidade.",
    "O sucesso é ir de fracasso em fracasso sem perder o entusiasmo.",
    "Se você não está disposto a arriscar, esteja disposto a uma vida comum.",
    "Acredite em si próprio e chegará um dia em que os outros não terão outra escolha senão acreditar com você."
  ];

  final List<String> _imagens = [
    'https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1494548162494-384bba4ab999?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1506744626753-1fa7603a4b27?w=500&auto=format&fit=crop&q=60',
    'https://images.unsplash.com/photo-1470071131384-001b85755536?w=500&auto=format&fit=crop&q=60'
  ];

  void _gerarFraseEImagem() {
    setState(() {
      _fraseAleatoria = Random().nextInt(_frases.length);
      _imagemAleatoria = Random().nextInt(_imagens.length);
    });
  }

  @override
  void initState() {
    super.initState();
    _gerarFraseEImagem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      _imagens[_imagemAleatoria],
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          width: double.infinity,
                          alignment: Alignment.center,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error, size: 50, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                Text(
                  _frases[_fraseAleatoria],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                    fontFamily: 'Serif',
                    letterSpacing: 1.2,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 48),
                
                ElevatedButton.icon(
                  onPressed: _gerarFraseEImagem,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  icon: const Icon(Icons.refresh, size: 28),
                  label: const Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
