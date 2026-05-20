import 'package:flutter/material.dart';
import '../screens/tela_detalhes.dart';
import '../controllers/controlador_favoritos.dart';
import '../theme/cores.dart';

class CartaoProduto extends StatefulWidget {
  final Map<String, dynamic> produto;

  const CartaoProduto({super.key, required this.produto});

  @override
  State<CartaoProduto> createState() => _CartaoProdutoState();
}

class _CartaoProdutoState extends State<CartaoProduto> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaDetalhes(produto: widget.produto),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagem do Energético
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        'assets/${widget.produto["imagem"]}',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.bolt,
                          size: 50,
                          color: AppCores.amareloRB,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Título do Red Bull
                  Text(
                    widget.produto["title"] ?? "Red Bull",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppCores.azulEscuro,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  // Preço
                  Text(
                    'R\$ ${widget.produto["preco"]}',
                    style: const TextStyle(
                      color: AppCores.vermelhoRB,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          
            Positioned(
              top: 5,
              right: 5,
              child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                valueListenable: ControladorFavoritos.itens,
                builder: (context, favoritos, child) {
                  final idProduto = widget.produto["id"].toString();
                  final eFavorito = ControladorFavoritos.eFavorito(idProduto);

                  return IconButton(
                    icon: Icon(
                      eFavorito ? Icons.favorite : Icons.favorite_border, 
                      color: AppCores.vermelhoRB, 
                      size: 24,
                    ),
                    onPressed: () {
                      ControladorFavoritos.alternarFavorito(widget.produto);
                
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            !eFavorito 
                                ? "${widget.produto["title"]} adicionado aos favoritos!" 
                                : "Removido dos favoritos.",
                          ),
                          duration: const Duration(seconds: 1),
                          backgroundColor: AppCores.azulMedio,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}