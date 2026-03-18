import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ATM Consultoria",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              const SizedBox(height: 48),
              _buildMenuGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MenuItem(
              image: "images/menu_empresa.png",
              onTap: () => Navigator.pushNamed(context, "/empresa"),
            ),
            const SizedBox(width: 32),
            _MenuItem(
              image: "images/menu_servico.png",
              onTap: () => Navigator.pushNamed(context, "/servico"),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _MenuItem(
              image: "images/menu_cliente.png",
              onTap: () => Navigator.pushNamed(context, "/cliente"),
            ),
            const SizedBox(width: 32),
            _MenuItem(
              image: "images/menu_contato.png",
              onTap: () => Navigator.pushNamed(context, "/contato"),
            ),
          ],
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _MenuItem({required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(image),
      ),
    );
  }
}
