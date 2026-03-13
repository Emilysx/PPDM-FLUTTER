import 'package:flutter/material.dart';

// Componente com Parâmetro
class Descricao extends StatelessWidget {
  String texto; //Componente espera receber uma variavel string
  Color? cor = const Color.fromARGB(255, 255, 255, 255); // Cor é opcional, se não quiser, por padrão a cor é preta
  Descricao({super.key, required this.texto, this.cor});

  @override
  Widget build(BuildContext context) {
    return Text(texto, 
    style: TextStyle(
      color: cor,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      shadows: [
      Shadow(
        blurRadius: 10.0, 
        color: const Color.fromARGB(118, 0, 0, 0),
        offset: Offset(5.0, 5.0), 
      ),
    ],
    ),
    );
  }
}