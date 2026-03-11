import 'package:flutter/material.dart';
// Importando as outras páginas para o Flutter saber que elas existem
import './Login.dart';
import './Onboarding2.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCADF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Título Superior
            const Text(
              "Bem-Vindo ao",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/frame.png", 
              height: 80,
            ),
            const SizedBox(height: 20),
            // Descrição centralizada
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "O aplicativo perfeito para cuidar da saúde do seu melhor amigo. Aqui você encontra veterinários, dicas e acompanhamento para seu pet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Área da imagem com os botões por cima (Stack)
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/cachorros.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),

                  // Botões inferiores
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Botão Pular
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF80AB), // Rosa forte
                            foregroundColor: Colors.white,
                            minimumSize: const Size(140, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Pular", style: TextStyle(fontSize: 18)),
                        ),
                        // Botão Próximo
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Onboarding2()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B4332), // Verde escuro
                            foregroundColor: Colors.white,
                            minimumSize: const Size(140, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Próximo", style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
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