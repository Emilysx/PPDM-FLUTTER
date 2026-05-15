import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLocal extends StatefulWidget {
  const TelaLocal({super.key});

  @override
  State<TelaLocal> createState() => _TelaLocalState();
}

class _TelaLocalState extends State<TelaLocal> {
  // Controlador para o texto, igual você usa nos seus projetos
  final TextEditingController _controllerFavorito = TextEditingController();
  String _saborSalvo = "Nenhum favorito salvo";

  @override
  void initState() {
    super.initState();
    _carregarFavorito();
  }

  // Função para carregar o dado (Persistência Local)
  _carregarFavorito() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _saborSalvo = prefs.getString('favorito') ?? "Nenhum favorito salvo";
    });
  }

  // Função para salvar o dado
  _salvarFavorito() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorito', _controllerFavorito.text);
    _controllerFavorito.clear();
    _carregarFavorito(); // Atualiza a tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Favorito"),
        backgroundColor: const Color(0xFF000B47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Qual o seu Red Bull favorito?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerFavorito,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ex: Red Bull Summer Edition",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarFavorito,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text("Salvar Preferência"),
            ),
            const SizedBox(height: 40),
            const Divider(),
            const Text("Salvo no dispositivo:"),
            Text(
              _saborSalvo,
              style: const TextStyle(
                fontSize: 20, 
                color: Color(0xFF000B47), 
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}