import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  // Variavel que obversa o que o usuario digita
  TextEditingController valorDigitado =
      TextEditingController(); // agora vai funciobar

  void fazerPost() async {
    final respostaServidor = await http.post(
      Uri.parse("http://10.109.72.11:3000/tasks"),
      headers: {"Content-Type": "application/json"}, // Estou enciando um json para o post
      body: jsonEncode({
        "title": valorDigitado.text // O nove resgistro da API receberá no campo Title o valor digitado
      })
    );

    if (respostaServidor.statusCode == 201 || respostaServidor.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Dados enviado com secesso!!"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Post")),
      body: Center(
        child: Column(
          children: [
            TextField(controller: valorDigitado,),
            TextButton(onPressed: fazerPost, child: Text("Adicionar Tarefa: "))
          ],
        ),
      )
    );
  }
}
