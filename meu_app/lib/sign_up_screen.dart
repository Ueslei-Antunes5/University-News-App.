import 'package:flutter/material.dart';
import 'package:meu_app/ProfilePage.dart';
import 'package:meu_app/navigation.dart';

//falta criar duas opcoes signup como media ou como visitante e o botao de signup

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  static void hash(BuildContext context, MaterialPageRoute materialPageRoute) {}
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isReporter = false; // Estado para o checkbox "Reporter"
  bool isVisitor = false; // Estado para o checkbox "Visitante"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nome',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'E-mail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu e-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Telefone',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Senha',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: isReporter,
                    onChanged: (bool? value) {
                      setState(() {
                        isReporter = value ?? false;
                        if (isReporter) isVisitor = false; // Desmarca visitante
                      });
                    },
                  ),
                  const Text('Reporter'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isVisitor,
                    onChanged: (bool? value) {
                      setState(() {
                        isVisitor = value ?? false;
                        if (isVisitor) isReporter = false; // Desmarca reporter
                      });
                    },
                  ),
                  const Text('Visitante'),
                ],
              ),
              const SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação ao pressionar o botão de Sign Up
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Preencha todos os campos!'),
                        ),
                      );
                      return;
                    }

                    if (!isReporter && !isVisitor) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Selecione Reporter ou Visitante!'),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    });
                  },
                  child: ElevatedButton(
          onPressed: () {
            // Simular cadastro bem-sucedido e navegar para a tela de navegação
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationScreen()),
            );
          },
          child: const Text('Sign Up'),
        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
