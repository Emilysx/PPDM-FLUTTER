import 'package:coffeshop/components/botaoprincipal.dart';
import 'package:coffeshop/components/descricao.dart';
import 'package:coffeshop/components/titulo.dart';
import 'package:coffeshop/pages/Telaprincipal.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COFFE SHOP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        toolbarHeight: 100,
        backgroundColor: Color(0xFF775537),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Descricao(
                    texto: "Bem vindo ao App mais famoso de café!", cor: const Color.fromARGB(255, 255, 255, 255)
                  ),
                ),
                const Spacer(),
                BotaoPrincipal(pagina: const TelaPrincipal(), texto: "Entrar"),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
