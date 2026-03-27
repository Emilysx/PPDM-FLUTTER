import 'package:flutter/material.dart';
import '../components/CardProjetoDetalhe.dart';

class Projetos extends StatelessWidget {
  const Projetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EEE9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF6D8CBA),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Meus Projetos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const CardProjetoDetalhe(
                  titulo: 'Solis',
                  imagem: 'solis',
                  corFundo: Color(0xFFE9B2D1),
                  descricao: 'Objetivo é organizar e centralizar demandas relatadas por colaboradores, facilitando o acompanhamento de problemas e melhorando o fluxo de trabalho.',
                ),
                const CardProjetoDetalhe(
                  titulo: 'VIX',
                  imagem: 'vix',
                  corFundo: Color(0xFFA6CFE2),
                  descricao: 'Automatizar a conferência de planilhas de compradores, reduzindo processos manuais e erros, por meio da centralização de informações e apoio ao planejamento.',
                ),
                const CardProjetoDetalhe(
                  titulo: 'Melia (TCC)',
                  imagem: 'melia',
                  corFundo: Color(0xFF88A6C9),
                  descricao: 'A MELIA surgiu para dar visibilidade às competências, formações e alocação em projetos, eliminando gargalos. A plataforma centraliza essas informações, melhora a comunicação e torna a execução dos projetos mais estratégica.',
                ),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}