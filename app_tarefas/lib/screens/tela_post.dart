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

  // Paleta de Cores
  static const Color softBlue = Color(0xFF8CA7F4);
  static const Color oatMilk = Color(0xFFFEF8F0);
  static const Color deepGrey = Color(0XFF4A4A4A);

  void fazerPost() async {
    final respostaServidor = await http.post(
      Uri.parse("https://api-tarefas-6jw4.onrender.com/tasks"),
      headers: {"Content-Type": "application/json"}, // Estou enciando um json para o post
      body: jsonEncode({
        "title": valorDigitado.text // O nove resgistro da API receberá no campo Title o valor digitado
      })
    );

    if (respostaServidor.statusCode == 201 || respostaServidor.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Dados enviado com secesso!!", textAlign: TextAlign.center),
        backgroundColor: softBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(20),
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oatMilk,
      // Navbar superior descrevendo a tela
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "NOVA TAREFA",
              style: TextStyle(color: softBlue, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            Text(
              "Adicionar ao Plano",
              style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              // Ilustração ou Ícone Central
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: softBlue.withOpacity(0.1), blurRadius: 20)],
                ),
                child: const Icon(Icons.note_add_rounded, size: 60, color: softBlue),
              ),
              const SizedBox(height: 50),

              // Campo de Entrada Estilizado
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: softBlue.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))
                  ],
                ),
                child: TextField(
                  controller: valorDigitado,
                  style: const TextStyle(color: deepGrey, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: "O que precisa ser feito?",
                    hintStyle: TextStyle(color: deepGrey.withOpacity(0.4)),
                    prefixIcon: const Icon(Icons.edit_note_rounded, color: softBlue),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Botão de Ação Estilizado
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: fazerPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: softBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    shadowColor: softBlue.withOpacity(0.4),
                  ),
                  child: const Text(
                    "ADICIONAR TAREFA",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}