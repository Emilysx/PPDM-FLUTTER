//biblioteca que importa os componentes do flutter
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(TelaInicial());
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // material app prove os componentes para a sua tela
      home: Scaffold(
        // divide a tela até em 3 partes
        appBar: AppBar(
          title: Text(
            "Tela Inicial APP1",
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Arial",
            ),
            textAlign: TextAlign.end,
          ),
          backgroundColor: const Color.fromARGB(255, 133, 18, 249),

          //Para deixar o titulo no centro
          //centerTitle: true,
        ),

        body: Column(
          spacing: 15, // espaçamento
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 133, 18, 249),
              margin: EdgeInsets.only(top:15, left: 15),
              
            ),
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 125, 16, 234),
              margin: EdgeInsets.only(left: 15),
            ),
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 114, 15, 212),
              margin: EdgeInsets.only(left: 15),
            ),
            Row(
              spacing: 15,
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 133, 18, 249),
              margin: EdgeInsets.only(left: 15),
            ),
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 125, 16, 234),
            ),
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 114, 15, 212),
            ),
            ],)
          ],
        ),
      ),
    );
  }
}
