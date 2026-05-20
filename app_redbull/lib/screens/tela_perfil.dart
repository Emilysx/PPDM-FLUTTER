import 'package:flutter/material.dart';
import '../services/banco_local.dart';
import '../theme/cores.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  String _nomeSalvo = "User Red Bull";
  String _emailSalvo = "user.redbull@email.com";

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    final perfil = await BancoLocal.carregarPerfil();
    setState(() {
      _nomeSalvo = perfil["nome"]!;
      _emailSalvo = perfil["email"]!;
    });
  }

  void _salvarDados() async {
    await BancoLocal.salvarPerfil(_nomeController.text, _emailController.text);
    _carregarDados();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Perfil atualizado localmente!"), backgroundColor: AppCores.azulMedio),
    );
  }

  void _abrirModalEdicao() {
    _nomeController.text = _nomeSalvo;
    _emailController.text = _emailSalvo;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppCores.oatMilk,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 25, left: 25, right: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("EDITAR PERFIL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppCores.azulEscuro)),
            const SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "E-mail", border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _salvarDados,
                style: ElevatedButton.styleFrom(backgroundColor: AppCores.azulEscuro),
                child: const Text("SALVAR ALTERAÇÕES", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCores.oatMilk,
      appBar: AppBar(
        title: const Text("MEU PERFIL", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
        backgroundColor: AppCores.azulEscuro,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppCores.azulEscuro,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            padding: const EdgeInsets.only(bottom: 30, top: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: AppCores.amareloRB,
                      child: CircleAvatar(
                        radius: 51,
                        backgroundColor: AppCores.oatMilk,
                        child: Icon(Icons.person, size: 55, color: AppCores.azulEscuro),
                      ),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: GestureDetector(
                        onTap: _abrirModalEdicao,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppCores.vermelhoRB, shape: BoxShape.circle),
                          child: const Icon(Icons.edit, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(_nomeSalvo, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(_emailSalvo, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: _abrirModalEdicao,
                icon: const Icon(Icons.settings, color: AppCores.azulEscuro),
                label: const Text("EDITAR DADOS DA CONTA", style: TextStyle(color: AppCores.azulEscuro, fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppCores.azulEscuro, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}