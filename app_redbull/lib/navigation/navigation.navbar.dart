import 'package:flutter/material.dart';
// Importe suas telas aqui conforme for criando elas
import '../screens/tela_get.dart';
import '../screens/tela_post.dart';
import '../screens/tela_local.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int indexAtual = 0;

  // Lista de páginas seguindo seu padrão
  List pages = [
    const TelaGet(),    // Sua tela de consulta
    const TelaPost(),   // Sua tela de cadastro
    const TelaLocal(),  // Sua tela de favoritos/local
  ];

  void mudarIndex(int novoIndex) {
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexAtual,
        onTap: mudarIndex,
        selectedItemColor: const Color(0xFF000B47), // Azul Red Bull
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: "Produtos"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Sugerir"),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: "Favoritos"),
        ],
      ),
    );
  }
}