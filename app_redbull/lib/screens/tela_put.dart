import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPut extends StatefulWidget {
  const TelaPut({super.key});

  @override
  State<TelaPut> createState() => _TelaPutState();
}

class _TelaPutState extends State<TelaPut> {
  // Controladores para os campos de edição
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _novoPrecoController = TextEditingController();

  // Cores padrão do seu projeto
  static const Color azulRedBull = Color(0xFF000B47);
  static const Color oatMilk = Color(0xFFFEF8F0);

  Future<void> atualizarProduto() async {
    final String id = _idController.text;
    
    // A URL para o PUT precisa do ID do produto no final
    final url = Uri.parse("https://api-redbull.onrender.com/db.json/$id");

    try {
      final resposta = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": "Red Bull (Atualizado)", 
          "preco": _novoPrecoController.text,
          "descricao": "Preço atualizado via App",
          "sabor": "Original",
          "imagem": "redbull_original.png"
        }),
      );

      if (resposta.statusCode == 200) {
        _idController.clear();
        _novoPrecoController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Produto atualizado com sucesso! 🔄"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        throw Exception("Erro ao atualizar");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro: Verifique se o ID existe no servidor."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oatMilk,
      appBar: AppBar(
        title: const Text("EDITAR PRODUTO", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: azulRedBull,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.edit_note, size: 80, color: azulRedBull),
              const SizedBox(height: 20),
              const Text(
                "Informe o ID do produto para alterar o preço",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              
              // Campo para o ID
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "ID do Produto (Ex: 1)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers, color: azulRedBull),
                ),
              ),
              const SizedBox(height: 20),
              
              // Campo para o Novo Preço
              TextField(
                controller: _novoPrecoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Novo Preço (Ex: 12.00)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money, color: azulRedBull),
                ),
              ),
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: atualizarProduto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulRedBull,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    "ATUALIZAR NO SERVIDOR",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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