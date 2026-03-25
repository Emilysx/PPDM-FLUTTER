import 'package:flutter/material.dart';

class BotaoModal extends StatelessWidget {
  final String texto;
  final String imagem;
  final Color cor;
  final Widget conteudoModal;

  const BotaoModal({
    super.key,
    required this.texto,
    required this.imagem,
    required this.cor,
    required this.conteudoModal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => conteudoModal,
          );
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Image.asset('assets/$imagem.png', height: 30),
              const SizedBox(width: 20),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}