import 'package:flutter/material.dart';
import '../controllers/controlador_carrinho.dart';
import '../theme/cores.dart';
import 'tela_carrinho.dart';

class TelaDetalhes extends StatefulWidget {
  final Map<String, dynamic> produto;

  const TelaDetalhes({super.key, required this.produto});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  bool _isFavorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.produto["title"].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: AppCores.azulEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              width: double.infinity,
              child: Image.asset(
                'assets/${widget.produto["imagem"]}',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.bolt, size: 120, color: AppCores.amareloRB),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppCores.oatMilk,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              ),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.produto["title"] ?? "Red Bull", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppCores.azulEscuro)),
                      ),
                      Text("R\$ ${widget.produto["preco"]}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppCores.vermelhoRB)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(widget.produto["sabor"] ?? "Original", style: const TextStyle(color: AppCores.azulMedio, fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("SOBRE O SABOR", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppCores.azulEscuro)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.produto["descricao"] ?? "O clássico energético Red Bull que te dá asas.",
                        style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 55, width: 55,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: AppCores.azulMedio, width: 2)),
                        child: IconButton(
                          icon: const Icon(Icons.add_shopping_cart, color: AppCores.azulMedio),
                          onPressed: () {
                            ControladorCarrinho.adicionar(widget.produto);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Adicionado ao carrinho! 🛒"), backgroundColor: AppCores.azulMedio));
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              ControladorCarrinho.adicionar(widget.produto);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaCarrinho()));
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: AppCores.azulEscuro, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                            child: const Text("COMPRAR AGORA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}