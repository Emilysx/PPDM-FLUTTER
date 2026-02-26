import 'package:app_banco/pages/telaBoleto.dart';
import 'package:app_banco/pages/telaCartao.dart';
import 'package:app_banco/pages/telaPix.dart';
import 'package:flutter/material.dart';

// color: Color (0XFF e colocar o hex da cor)
void main() {
  // Classe centralizadora é chamada de MyApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(), //Coloque a tela inicial dentro do Material
    );
  }
}

// TELA INICIAL
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF8A05BE),
        // Para aumentar a altura da AppBar
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(117, 224, 224, 224),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/perfil.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),

                Spacer(), // empurra os itens para a direita
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/olho-fechado.png',
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 20),
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/duvida.png', fit: BoxFit.cover),
                ),

                SizedBox(width: 20),
                Container(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/novo-email.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Text(
              "Olá, Emily Gabrielle",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            child: const Text(
              "Conta",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 1, left: 15, bottom: 30),
            child: const Text("R\$5,000", style: TextStyle(fontSize: 20)),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // PIX
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Telapix()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/pix.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          " Área Pix",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // BOLETO
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Telaboleto()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/boleto.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Boleto", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),

              // CARTÃO
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Telacartao()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/cartao.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Cartão", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),

              // TRASFERIR
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Telaboleto()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/transferir-dinheiro.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Trasferir",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              height: 50,
              width: double.infinity, // 👈 ocupa toda largura da tela
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset("assets/cartao.png", width: 25, height: 25),
                  const SizedBox(width: 10),
                  const Text(
                    "Meus Cartões",
                    style: TextStyle(fontWeight: FontWeight.w500),
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
