import 'package:flutter/material.dart';
import '../controllers/controlador_favoritos.dart';
import '../components/cartao_produto.dart';
import '../theme/cores.dart';

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text(
          "MEUS FAVORITOS", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)
        ),
        backgroundColor: AppCores.azulEscuro,
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: ControladorFavoritos.itens,
        builder: (context, listaFavoritos, child) {
          // Se não tiver nenhum favorito ainda
          if (listaFavoritos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 70, color: AppCores.azulMedio.withOpacity(0.4)),
                  const SizedBox(height: 15),
                  const Text(
                    "Nenhum energético favoritado",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppCores.azulEscuro),
                  ),
                  const SizedBox(height: 5),
                  const Text("Toque no coração na vitrine para salvar!", style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          // Grade bonita com os produtos favoritados
          return GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.82,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: listaFavoritos.length,
            itemBuilder: (context, index) {
              return CartaoProduto(produto: listaFavoritos[index]);
            },
          );
        },
      ),
    );
  }
}