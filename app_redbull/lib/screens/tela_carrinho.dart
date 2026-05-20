import 'package:flutter/material.dart';
import '../controllers/controlador_carrinho.dart';
import '../theme/cores.dart';

class TelaCarrinho extends StatelessWidget {
  const TelaCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text("MEU CARRINHO", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
        backgroundColor: AppCores.azulEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder<List<ItemCarrinho>>(
        valueListenable: ControladorCarrinho.itens,
        builder: (context, listaItens, child) {
          if (listaItens.isEmpty) {
            return const Center(
              child: Text("Seu carrinho está vazio!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppCores.azulEscuro)),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: listaItens.length,
                  itemBuilder: (context, index) {
                    final item = listaItens[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Container(
                              width: 70, height: 70,
                              decoration: BoxDecoration(color: AppCores.oatMilk, borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(5),
                              child: Image.asset('assets/${item.imagem}', fit: BoxFit.contain),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppCores.azulEscuro)),
                                  const SizedBox(height: 5),
                                  Text("R\$ ${item.preco}", style: const TextStyle(color: AppCores.vermelhoRB, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: AppCores.vermelhoRB),
                                  onPressed: () => ControladorCarrinho.remover(item.id),
                                ),
                                Container(
                                  decoration: BoxDecoration(color: AppCores.oatMilk, borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      IconButton(icon: const Icon(Icons.remove, size: 16), onPressed: () => ControladorCarrinho.diminuirQuantidade(item.id)),
                                      Text("${item.quantidade}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                      IconButton(icon: const Icon(Icons.add, size: 16), onPressed: () => ControladorCarrinho.aumentarQuantidade(item.id)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: AppCores.azulEscuro, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                padding: const EdgeInsets.all(25),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("VALOR TOTAL", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                          Text("R\$ ${ControladorCarrinho.valorTotal.toStringAsFixed(2)}", style: const TextStyle(color: AppCores.amareloRB, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity, height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: AppCores.vermelhoRB, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          child: const Text("FINALIZAR COMPRA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}