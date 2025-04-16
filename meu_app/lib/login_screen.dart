import 'package:flutter/material.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor do conteúdo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'E-mail',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Digite seu e-mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Senha',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Digite sua senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de login
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login realizado com sucesso!')),
                  );
                },
                child: const Text('Entrar'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navegar para a tela de cadastro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue, // Define a cor do texto do botão
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),

    );
  }
}