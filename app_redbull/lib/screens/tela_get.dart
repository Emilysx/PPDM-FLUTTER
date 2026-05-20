import 'package:flutter/material.dart';
import '../components/cartao_produto.dart';
import '../services/servico_redbull.dart';
import '../theme/cores.dart';
import 'tela_carrinho.dart';

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text(
          "RED BULL", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)
        ),
        backgroundColor: AppCores.azulEscuro,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaCarrinho()));
            },
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ServicoRedBull.buscarProdutos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppCores.vermelhoRB));
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao sincronizar com o servidor", style: TextStyle(fontWeight: FontWeight.bold, color: AppCores.azulEscuro)),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum energético encontrado."));
          }

          final produtos = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.82,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return CartaoProduto(produto: produtos[index]);
            },
          );
        },
      ),
    );
  }
}