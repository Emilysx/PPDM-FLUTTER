import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  // Controladores para pegar o texto digitado
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 183, 207), // Tom de rosa bem claro do fundo
      body: SingleChildScrollView( // Permite rolar a tela se o teclado abrir
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 80),
              
              // Logo superior
              Image.asset(
                "assets/frame.png", // Nome do seu asset da logo
                height: 120,
              ),
              
              const SizedBox(height: 40),
              
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63), // Rosa do título
                ),
              ),
              
              const SizedBox(height: 30),

              // Campo de E-mail
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              // Campo de Senha
              TextField(
                controller: _senhaController,
                obscureText: true, // Esconde a senha
                decoration: InputDecoration(
                  labelText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Esqueci minha senha
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Botão Entrar
              ElevatedButton(
                onPressed: () {
                  // Lógica de login futura
                  print("Login: ${_emailController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4332), // Verde escuro
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),

              // Criar conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta?"),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroPage()));
                    },
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                        color: Color(0xFFE91E63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}