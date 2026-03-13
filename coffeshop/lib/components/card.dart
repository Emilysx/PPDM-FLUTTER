import 'package:flutter/material.dart';
 
class Cardizinho extends StatelessWidget {
  String nome;
  double valor;
  String imagem;
  Cardizinho({super.key, required this.imagem, required this.nome, required this.valor});
 
  @override
  Widget build(BuildContext context) {
    return Container(
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  color:  Color(0xFF775537),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagem),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                     Text(
                      nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      valor.toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
  }
}