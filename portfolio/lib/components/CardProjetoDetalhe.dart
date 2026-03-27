import 'package:flutter/material.dart';

class CardProjetoDetalhe extends StatelessWidget {
  final String titulo;
  final String imagem;
  final Color corFundo;
  final String descricao;

  const CardProjetoDetalhe({
    super.key,
    required this.titulo,
    required this.imagem,
    required this.corFundo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TITULO + IMAGEM
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                  ),
                ),
              ),

              Image.asset(
                'assets/$imagem.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ],
          ),

          const SizedBox(height: 6),

          // LINHA
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white.withOpacity(0.6),
          ),

          const SizedBox(height: 8),

          // DESCRIÇÃO
          Text(
            descricao,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}