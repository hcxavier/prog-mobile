import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade700,
        title: const Text("Clientes"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_cliente.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Nossos Clientes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.lime,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              _buildClientItem("images/cliente1.png", "Empresa de Software"),
              const SizedBox(height: 32),
              _buildClientItem("images/cliente2.png", "Empresa de Auditoria"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClientItem(String image, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
