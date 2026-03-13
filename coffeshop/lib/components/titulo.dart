import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Coffe Shop", 
    style: TextStyle(
      fontSize: 30, // Tamanho da Fonte
      color: Colors.brown.shade900, //cor
      fontWeight: FontWeight.bold, // espessura da fonte
      letterSpacing: 2 //espaçamento
    ),
    );
  }
}