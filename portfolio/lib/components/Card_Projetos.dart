import 'package:flutter/material.dart';
import 'package:portfolio/pages/Projetos.dart';

class CardProjetos extends StatelessWidget {
  const CardProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width * 1;

    return Center(
      child: SizedBox(
        width: largura,
        child: Stack(
          children: [
            Image.asset(
              'assets/projetos.png',
              width: largura,
              fit: BoxFit.contain,
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: largura * 0.05, 
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Projetos()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9CADA),
                    foregroundColor: const Color(0xFFE91E63),
                    elevation: 4,
                    shadowColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Meus projetos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}