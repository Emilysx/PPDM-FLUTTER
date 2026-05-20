import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/cores.dart';

class TelaPut extends StatefulWidget {
  const TelaPut({super.key});

  @override
  State<TelaPut> createState() => _TelaPutState();
}

class _TelaPutState extends State<TelaPut> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _novoPrecoController = TextEditingController();

  Future<void> atualizarProduto() async {
    final String id = _idController.text;
    final url = Uri.parse("https://api-redbull.onrender.com/produtos/$id");

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
          const SnackBar(content: Text("Produto atualizado com sucesso! 🔄"), backgroundColor: Colors.green),
        );
      } else {
        throw Exception("Erro ao atualizar");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro: Verifique se o ID existe no servidor."), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text("EDITAR PRODUTO", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppCores.azulEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.edit_note, size: 80, color: AppCores.azulEscuro),
              const SizedBox(height: 20),
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "ID do Produto (Ex: 1)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers, color: AppCores.azulEscuro),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _novoPrecoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Novo Preço (Ex: 12.00)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money, color: AppCores.azulEscuro),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: atualizarProduto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCores.azulEscuro,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("ATUALIZAR NO SERVIDOR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}