import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: const Text("Empresa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_empresa.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a Empresa",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "A ATM Consultoria é uma empresa focada em resultados. "
                "Atuamos no mercado há mais de 20 anos, oferecendo as melhores soluções "
                "para o seu negócio.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              const Text(
                "Nossa missão é transformar a gestão das empresas brasileiras através de "
                "inovação e tecnologia, garantindo sustentabilidade e crescimento.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              const Text(
                "Duis sint consectetur sint ad non tempor excepteur. Eu in excepteur mollit sint nostrud. Quis nisi aliquip do sit amet Lorem ut Lorem esse cillum. Ipsum reprehenderit dolor pariatur laboris. Eu est enim mollit sint laboris culpa est cillum eiusmod occaecat do. Anim occaecat proident Lorem id qui est. Tempor eiusmod officia eiusmod minim exercitation eiusmod anim do aliqua consequat laborum sunt nulla excepteur.",
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
