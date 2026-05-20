import 'package:flutter/material.dart';
import '../screens/tela_get.dart';
import '../screens/tela_carrinho.dart';
import '../screens/tela_favoritos.dart';
import '../screens/tela_perfil.dart'; // Importando a nova tela de perfil
import '../theme/cores.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _indexAtual = 0;

  // Lista com as 4 telas ordenadas exatamente como você pediu
  final List<Widget> _paginas = [
    const TelaGet(),       // Produtos
    const TelaCarrinho(),    // Carrinho
    const TelaFavoritos(),   // Favoritos
    const TelaPerfil(),      // Perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_indexAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: (index) {
          setState(() {
            _indexAtual = index;
          });
        },
        // Configurações de estilo da barra inferior
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppCores.azulEscuro,
        selectedItemColor: AppCores.amareloRB, // Cor amarela quando selecionado
        unselectedItemColor: Colors.white.withOpacity(0.6), // Branco fosco quando apagado
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        
        // Itens ordenados: Produtos, Carrinho, Favoritos, Perfil
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink_outlined),
            activeIcon: Icon(Icons.local_drink),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}