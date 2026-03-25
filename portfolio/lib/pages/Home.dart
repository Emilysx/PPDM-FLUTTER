import 'package:flutter/material.dart';
import 'package:portfolio/components/Botao_Modal.dart';
import 'package:portfolio/components/Card_Projetos.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EEE9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              decoration: const BoxDecoration(
                color: Color(0xFF6D8CBA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/perfil2.png', width: 120, height: 120, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Emily Gabrielle Oliveira', style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'Serif')),
                        const Text('Monte Mor - SP', style: TextStyle(color: Colors.white, fontSize: 16)),
                        const Text('20 anos', style: TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset('assets/linkedin.png', height: 35),
                            const SizedBox(width: 8),
                            Image.asset('assets/instagram.png', height: 35),
                            const SizedBox(width: 8),
                            Image.asset('assets/github.png', height: 35),
                            const SizedBox(width: 8),
                            Image.asset('assets/email.png', height: 35),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Quem sou eu ?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Serif')),
                  const SizedBox(height: 10),
                  const Text(
                    'Sou Emily Gabrielle, aprendiz na Bosch e atuo na área de PS/MSE. Atualmente, curso o técnico em Desenvolvimento de Sistemas no Senai Roberto Mange e tenho interesse em tecnologia e desenvolvimento.',
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                  const SizedBox(height: 25),
                  const BotaoModal(
                    texto: 'Formação',
                    imagem: 'formacao',
                    cor: Color(0xFFE9B2D1),
                    conteudoModal: Center(child: Text('Detalhes da Formação')),
                  ),
                  const BotaoModal(
                    texto: 'Tecnologias',
                    imagem: 'tecnologia',
                    cor: Color(0xFFA6CFE2),
                    conteudoModal: Center(child: Text('Minhas Tecnologias')),
                  ),
                  const BotaoModal(
                    texto: 'Curiosidade',
                    imagem: 'curiosidade',
                    cor: Color(0xFF88A6C9),
                    conteudoModal: Center(child: Text('Curiosidades sobre mim')),
                  ),
                  const SizedBox(height: 10),
                  const Text('Projetos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Serif')),
                  const SizedBox(height: 15),
                  const CardProjetos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}