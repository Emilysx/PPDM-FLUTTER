import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  // vamos codar a nossa logiga aqui
  List listApi = [];

  @override // Garente que o estado inicial sempre reinicie
  // Serve para rodar uma função ao abrir uma tela
  void initState() {
    // Garente que vai funcionar no estado iniial
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    final respostaServidor = await http.get(
      Uri.parse("http://10.109.72.11:3000/tasks"),
    );
    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listApi = dados;
      });
    }
  }

  void fazerDelete(final id) async {
    final respostaServidor = await http.delete(
      Uri.parse("http://10.109.72.11:3000/tasks/$id"),
    );

    if (respostaServidor.statusCode == 200) {
      fazerGet(); // Atualizo a minha tela

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Dado deletado com Secesso!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cores da Paleta
    const Color softBlue = Color(0xFF8CA7F4);
    const Color yuzuZest = Color(0xFFDBF48C);
    const Color pastelPurple = Color(0xFFD98CF4);
    const Color oatMilk = Color(0xFFFEF8F0);

    return Scaffold(
      backgroundColor: oatMilk,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: softBlue.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gerenciar",
                        style: TextStyle(
                          fontSize: 18,
                          color: softBlue.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "Minhas Tarefas",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: softBlue,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: yuzuZest,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),

                // Lista de Tarefas
                Expanded(
                  child: listApi.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(color: yuzuZest),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: listApi.length,
                          itemBuilder: (context, index) {
                            final item = listApi[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: softBlue.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: oatMilk,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.assignment_outlined,
                                    color: softBlue,
                                  ),
                                ),
                                title: Text(
                                  item["title"] ?? "Sem título",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF4A4A4A),
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () => fazerDelete(item["id"]),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: pastelPurple.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: pastelPurple,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
