import 'package:flutter/material.dart';
import 'package:meu_app/ProfilePage.dart';
import 'package:meu_app/main.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  String selectedCategory = 'Todos'; // Categoria selecionada

  // Lista de notícias
  final List<Map<String, String>> allNews = [
    {'category': 'Política', 'title': 'Reforma política é aprovada no Senado'},
    {'category': 'Tecnologia', 'title': 'Novo smartphone é lançado no mercado'},
    {'category': 'Saudável', 'title': 'Dicas para uma alimentação balanceada'},
    {'category': 'Ciência', 'title': 'Descoberta de nova partícula subatômica'},
    {'category': 'Todos', 'title': 'Notícia geral para todos os públicos'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrar notícias com base na categoria selecionada
    final filteredNews =
        selectedCategory == 'Todos'
            ? allNews
            : allNews
                .where((news) => news['category'] == selectedCategory)
                .toList();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(33, 150, 243, 1)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 5),
            const Text(
              'Medianeira PR, Brasil',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.black),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildCategoryButton('Todos'),
                const SizedBox(width: 12),
                _buildCategoryButton('Política'),
                const SizedBox(width: 12),
                _buildCategoryButton('Tecnologia'),
                const SizedBox(width: 12),
                _buildCategoryButton('Saudável'),
                const SizedBox(width: 12),
                _buildCategoryButton('Ciência'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredNews.length,
              itemBuilder: (context, index) {
                final news = filteredNews[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news['title']!, // Título da notícia
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),  
                        const SizedBox(
                          height: 8,
                        ), // Espaçamento entre título e subtítulo
                        Text(
                          'Subtítulo da notícia', // Subtítulo (pode ser dinâmico se necessário)
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ), // Espaçamento entre subtítulo e texto
                        Text(
                          'Este é o texto descritivo da notícia. Ele pode conter mais detalhes sobre o conteúdo da notícia.',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Botão de categoria
  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category; // Atualiza a categoria selecionada
        });
      },
      child: Text(
        category,
        style: TextStyle(
          fontWeight:
              selectedCategory == category
                  ? FontWeight.bold
                  : FontWeight.normal,
          color:
              selectedCategory == category
                  ? const Color.fromRGBO(33, 150, 243, 1)
                  : Colors.black,
        ),
      ),
    );
  }
}
