import 'package:flutter/material.dart';
import 'cadastro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> estabelecimentos = [
    {'nome': 'Barbearia do João', 'desc': 'Corte masculino'},
    {'nome': 'Salão da Maria', 'desc': 'Cabelo e estética'},
    {'nome': 'Oficina do Carlos', 'desc': 'Mecânica geral'},
    {'nome': 'Padaria Central', 'desc': 'Pães e café'},
    {'nome': 'Mercadinho Silva', 'desc': 'Produtos do dia a dia'},
    {'nome': 'Academia Fit', 'desc': 'Musculação e treino'},
  ];

  Widget _buildCard(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.store, size: 30, color: Colors.deepPurple),
            const Spacer(),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCard() {
    return GestureDetector(
      onTap: () async {
        final novo = await Navigator.push<Map<String, String>>(
          context,
          MaterialPageRoute(
            builder: (_) => const CadastroPage(),
          ),
        );

        if (!mounted) return;

        if (novo != null) {
          setState(() {
            estabelecimentos.insert(0, novo);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Estabelecimento cadastrado com sucesso'),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.deepPurple.withValues(alpha: 0.25),
            width: 1.4,
          ),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo.png',
          height: 128,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar serviços...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Serviços próximos',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildAddCard(),
                  ...estabelecimentos.map(
                        (e) => _buildCard(e['nome']!, e['desc']!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}