import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  final Widget pagina;
  final String texto;

  const BotaoPrincipal({super.key, required this.pagina, required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF775537), 
        foregroundColor: Colors.white,
        fixedSize: const Size(280, 60),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), 
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagina),
        );
      },
      child: Text(texto.toUpperCase()), 
    );
  }
}