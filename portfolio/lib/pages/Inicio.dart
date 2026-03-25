import 'package:flutter/material.dart';
import '../components/BotaoConhecer.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE FUNDO TELA TODA
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/fundo.png',
              fit: BoxFit.cover,
            ),
          ),

          // ÍCONES DE ESTRELA
          const Positioned(
            top: 60,
            right: 40,
            child: Icon(Icons.auto_awesome, color: Colors.white, size: 45),
          ),
          const Positioned(
            top: 250,
            left: 30,
            child: Icon(Icons.auto_awesome, color: Color(0xFF1A237E), size: 30),  
          ),

          // FOTO DE PERFIL
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/perfil.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.85,
            ),
          ),

          // TEXTOS E BOTÃO
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Portfólio',
                  
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontSize: 80,
                    color: Colors.white,
                    height: 1.0,
                    shadows: [
                      Shadow(offset: Offset(-1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, 1), color: Colors.black),
                      Shadow(offset: Offset(-1, 1), color: Colors.black),
                    ],
                  ),
                  
                ),
                const Text(
                  'Emily Gabrielle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    shadows: [
                      Shadow(offset: Offset(-1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, 1), color: Colors.black),
                      Shadow(offset: Offset(-1, 1), color: Colors.black),
                    ],
                  ),
                ),
                const Spacer(),
                
                const BotaoConhecer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}