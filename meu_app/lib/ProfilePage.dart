import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Ação para editar perfil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Editar perfil clicado!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Seção do cabeçalho com foto e informações básicas
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/41.jpg'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'João Silva',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'joao.silva@uninews.edu.br',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileButton(
                        icon: Icons.message,
                        label: 'Mensagem',
                        onPressed: () {},
                      ),
                      _buildProfileButton(
                        icon: Icons.share,
                        label: 'Compartilhar',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Seção de estatísticas
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(count: '24', label: 'Posts'),
                  _buildStatItem(count: '356', label: 'Seguidores'),
                  _buildStatItem(count: '120', label: 'Seguindo'),
                ],
              ),
            ),

            // Divisor
            const Divider(thickness: 1),

            // Lista de opções do perfil
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.bookmark,
                    label: 'Posts salvos',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.history,
                    label: 'Histórico',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.settings,
                    label: 'Configurações',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.help,
                    label: 'Ajuda',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.logout,
                    label: 'Sair',
                    onTap: () {
                      // Ação para logout
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sair clicado!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir botões do perfil
  Widget _buildProfileButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          color: Colors.blue,
        ),
        Text(
          label,
          style: const TextStyle(color: Color.fromRGBO(33, 150, 243, 1)),
        ),
      ],
    );
  }

  // Widget para construir itens de estatística
  Widget _buildStatItem({required String count, required String label}) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Widget para construir opções do perfil
  Widget _buildProfileOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}