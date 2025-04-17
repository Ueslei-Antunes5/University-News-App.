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
    {
      'category': 'Política',
      'title':
          'Reforma universitária: Congresso debate novo modelo de financiamento para instituições públicas',
      'subtitle': 'Mudanças no financiamento público',
      'description':
          'O Congresso Nacional está debatendo uma reforma universitária que pode alterar o modelo de financiamento das instituições públicas de ensino superior.',
    },
    {
      'category': 'Tecnologia',
      'title': 'Novo smartphone é lançado no mercado',
      'subtitle': 'Inovação tecnológica',
      'description':
          'O novo smartphone traz recursos avançados, como câmera de alta resolução, bateria de longa duração e suporte a redes 5G.',
    },
    {
      'category': 'Saudável',
      'title': 'Dicas para uma alimentação balanceada',
      'subtitle': 'Saúde em primeiro lugar',
      'description':
          'Especialistas recomendam incluir mais frutas, vegetais e grãos integrais na dieta para melhorar a saúde e o bem-estar.',
    },
    {
      'category': 'Ciência',
      'title': 'Descoberta de nova partícula subatômica',
      'subtitle': 'Avanço na física moderna',
      'description':
          'Cientistas descobriram uma nova partícula subatômica que pode revolucionar o entendimento atual sobre a composição da matéria.',
    },
    {
      'category': 'Todos',
      'title': 'Notícia geral para todos os públicos',
      'subtitle': 'Informação acessível',
      'description':
          'Esta notícia é destinada a todos os públicos e aborda temas gerais de interesse comum.',
    },
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
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
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
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.5,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white),
            const SizedBox(width: 5),
            const Text(
              'Medianeira PR, Brasil',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.white),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Define a rolagem horizontal
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
                  color: Colors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título da notícia
                        Text(
                          news['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Subtítulo da notícia
                        Text(
                          news['subtitle'] ?? 'Sem subtítulo',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Descrição da notícia
                        Text(
                          news['description'] ?? 'Sem descrição',
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

  // Botão de categoria estilizado
  Widget _buildCategoryButton(String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category; // Atualiza a categoria selecionada
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromRGBO(33, 150, 243, 1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromRGBO(33, 150, 243, 1)),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
