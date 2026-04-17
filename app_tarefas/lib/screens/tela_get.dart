import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String resultado = "Toque no botão para ler a nuvem";
  bool isLoading = false;

  // Paleta de Cores
  static const Color softBlue = Color(0xFF8CA7F4);
  static const Color yuzuZest = Color(0xFFDBF48C);
  static const Color oatMilk = Color(0xFFFEF8F0);
  static const Color deepGrey = Color(0XFF4A4A4A);

  void fazerGet() async {
    setState(() => isLoading = true);
    try {
      final resposta = await http.get(
        Uri.parse("https://api-tarefas-6jw4.onrender.com/tasks"),
      ).timeout(const Duration(seconds: 5));

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        setState(() {
          resultado = dados.isNotEmpty ? dados[0]["title"] : "Nenhum dado na lista";
        });
      }
    } catch (e) {
      setState(() => resultado = "Erro ao conectar");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oatMilk,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "CONSULTA",
              style: TextStyle(color: softBlue, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            Text(
              "Sincronizar Dados",
              style: TextStyle(color: deepGrey.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icone de Status
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(isLoading ? Icons.sync : Icons.cloud_done_rounded, size: 40, color: softBlue),
            ),
            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: softBlue.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator(color: yuzuZest))
                  : Text(
                      resultado,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: deepGrey),
                    ),
            ),
            
            const SizedBox(height: 50),

            SizedBox(
              width: 200, 
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : fazerGet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: softBlue,
                  shape: StadiumBorder(), 
                  elevation: 5,
                  shadowColor: softBlue.withOpacity(0.3),
                ),
                child: const Text(
                  "ATUALIZAR",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}