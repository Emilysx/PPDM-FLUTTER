import 'package:flutter/material.dart';

class CardProjetos extends StatelessWidget {
  const CardProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/projetos.png',
            width: 320,
            fit: BoxFit.contain,
          ),

          Positioned(
            bottom: 25,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9CADA),
                foregroundColor: const Color(0xFFE91E63),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Meus projetos',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}