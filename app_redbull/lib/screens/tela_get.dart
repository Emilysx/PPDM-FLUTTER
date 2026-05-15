import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // Sua URL exata conforme informada
  final String urlApi = 'https://api-redbull.onrender.com/db.json'; 

  Future<List> buscarProdutos() async {
    try {
      final resposta = await http.get(Uri.parse(urlApi));

      if (resposta.statusCode == 200) {
        // O seu db.json retorna um Objeto, precisamos da lista dentro de 'produtos'
        final Map<String, dynamic> dadosCompletos = jsonDecode(resposta.body);
        return dadosCompletos['produtos']; // Aqui está o segredo
      } else {
        throw Exception('Falha ao carregar');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F0),
      appBar: AppBar(
        title: const Text("CATÁLOGO RED BULL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF000B47),
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: buscarProdutos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Erro ao sincronizar com o servidor"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.asset(
                    'assets/${item["imagem"]}', 
                    width: 50,
                    errorBuilder: (ctx, err, stack) => const Icon(Icons.bolt, color: Colors.yellow),
                  ),
                  title: Text(item["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("R\$ ${item["preco"]}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}