import 'package:flutter/material.dart';
import 'package:meu_app/ProfilePage.dart';
import 'package:meu_app/navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Preencha os campos abaixo para criar sua conta:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(33, 150, 243, 1),
                ),
              ),
              const SizedBox(height: 24.0),
              _buildTextField(
                controller: nameController,
                label: 'Nome',
                hintText: 'Digite seu nome',
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: emailController,
                label: 'E-mail',
                hintText: 'Digite seu e-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: phoneController,
                label: 'Telefone',
                hintText: 'Digite seu telefone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: passwordController,
                label: 'Senha',
                hintText: 'Digite sua senha',
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Selecione seu tipo de conta:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Checkbox(
                    value: isReporter,
                    activeColor: const Color.fromRGBO(33, 150, 243, 1),
                    onChanged: (bool? value) {
                      setState(() {
                        isReporter = value ?? false;
                        if (isReporter) isVisitor = false; // Desmarca visitante
                      });
                    },
                  ),
                  const Text(
                    'Reporter',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isVisitor,
                    activeColor: const Color.fromRGBO(33, 150, 243, 1),
                    onChanged: (bool? value) {
                      setState(() {
                        isVisitor = value ?? false;
                        if (isVisitor) isReporter = false; // Desmarca reporter
                      });
                    },
                  ),
                  const Text(
                    'Visitante',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validação dos campos
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationScreen(),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para criar campos de texto estilizados
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromRGBO(33, 150, 243, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}