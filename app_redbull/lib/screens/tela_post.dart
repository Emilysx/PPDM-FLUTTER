import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/cores.dart';

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  final TextEditingController _saborController = TextEditingController();

  Future<void> fazerPost() async {
    final url = Uri.parse("https://api-redbull.onrender.com/produtos");

    try {
      final resposta = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": _saborController.text,
          "descricao": "Sugestão enviada via aplicativo por um fã.",
          "preco": "10.50",
          "sabor": "Edição Sugerida",
          "imagem": "redbull_original.png"
        }),
      );

      if (resposta.statusCode == 201 || resposta.statusCode == 200) {
        _saborController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sugestão de sabor enviada com sucesso! 🚀"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        throw Exception("Falha ao enviar");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao conectar com o servidor."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text("SUGERIR NOVO SABOR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: AppCores.azulEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lightbulb_outline, size: 100, color: AppCores.azulEscuro),
              const SizedBox(height: 20),
              const Text(
                "Qual sabor de Red Bull falta no nosso catálogo?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppCores.azulEscuro),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _saborController,
                decoration: InputDecoration(
                  labelText: "Nome do Sabor (ex: Red Bull Maracujá)",
                  labelStyle: const TextStyle(color: AppCores.azulEscuro),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppCores.azulEscuro, width: 2),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(Icons.edit, color: AppCores.azulEscuro),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_saborController.text.isNotEmpty) {
                      fazerPost();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCores.azulEscuro,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("ENVIAR PARA O SERVIDOR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}