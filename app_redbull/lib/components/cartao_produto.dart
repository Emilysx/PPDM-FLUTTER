import 'package:flutter/material.dart';

class CartaoProduto extends StatelessWidget {
  final Map produto; // Recebe o item do JSON

  const CartaoProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          // Exibe a imagem da pasta assets usando o nome que vem da API
          Expanded(
            child: Image.asset(
              'assets/${produto["imagem"]}',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.bolt, size: 50, color: Colors.yellow),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  produto["title"],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                Text(
                  produto["sabor"],
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 5),
                Text(
                  'R\$ ${produto["preco"]}',
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}