import 'package:flutter/material.dart';
// Importe as outras telas para os botões funcionarem
import 'Onboarding3.dart';
import 'Login.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo exata do seu FlutterFlow (#C7E7BD)
      backgroundColor: const Color(0xFFC7E7BD),
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior com a seta e o título
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Cuidados Veterinários",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Espaçador para centralizar o título
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Título e Texto de Descrição
            const Text(
              "Cuidados Veterinários",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4332), // Verde escuro
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Encontre clínicas veterinárias, agende consultas e acompanhe a saúde do seu pet com facilidade.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),

            // Área da imagem e botões
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Imagem dos veterinários (conforme sua pasta assets)
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/veteri.png"),
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
                        // Botão Pular -> Vai para o Login
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF80AB), // Rosa
                            minimumSize: const Size(140, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Pular", style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),

                        // Botão Próximo -> Vai para Onboarding3
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Onboarding3()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B4332), // Verde escuro
                            minimumSize: const Size(140, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Próximo", style: TextStyle(color: Colors.white, fontSize: 18)),
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