import 'package:flutter/material.dart';
import 'package:ativ_7/tela_empresa.dart';
import 'package:ativ_7/tela_inicial.dart';
import 'package:ativ_7/tela_servico.dart';
import 'package:ativ_7/tela_cliente.dart';
import 'package:ativ_7/tela_contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff61bd59), // ATM Green
          primary: const Color(0xff61bd59),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff61bd59),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TelaInicial(),
      routes: {
        "/empresa": (context) => const TelaEmpresa(),
        "/servico": (context) => const TelaServico(),
        "/cliente": (context) => const TelaCliente(),
        "/contato": (context) => const TelaContato(),
      },
    );
  }
}
