import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de configurações',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}