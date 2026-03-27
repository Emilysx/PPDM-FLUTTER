import 'package:flutter/material.dart';
import 'package:portfolio/components/Botao_Modal.dart';
import 'package:portfolio/components/Card_Projetos.dart';
import 'package:portfolio/components/SocialLinks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2EEE9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // HEADER
            Container(
              padding: EdgeInsets.fromLTRB(
                largura * 0.05,
                altura * 0.07,
                largura * 0.05,
                altura * 0.03,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF6D8CBA),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/perfil2.png',
                      width: largura * 0.34,
                      height: largura * 0.34,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: largura * 0.04),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Emily Gabrielle Oliveira',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: largura * 0.044,
                            fontFamily: 'Serif',
                          ),
                        ),
                        Text(
                          'Monte Mor - SP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: largura * 0.04,
                          ),
                        ),
                        Text(
                          '20 anos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: largura * 0.04,
                          ),
                        ),

                        SizedBox(height: altura * 0.01),

                        const SocialLinks(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // CONTEÚDO
            Padding(
              padding: EdgeInsets.all(largura * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quem sou eu ?',
                    style: TextStyle(
                      fontSize: largura * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),

                  SizedBox(height: altura * 0.01),

                  Text(
                    'Sou Emily Gabrielle, aprendiz na Bosch e atuo na área de PS/MSE, so setor da TEF4. Atualmente, curso o técnico em Desenvolvimento de Sistemas no Senai Roberto Mange e tenho interesse em tecnologia e desenvolvimento.',
                    style: TextStyle(
                      fontSize: largura * 0.035,
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: altura * 0.03),

                  BotaoModal(
                    texto: 'Formação',
                    imagem: 'formacao',
                    cor: const Color(0xFFE9B2D1),
                    conteudoModal: Container(
                      padding: const EdgeInsets.all(25),
                      height: 400,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Minha Formação',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Serif',
                              color: Color(0xFFBF0F6B),
                            ),
                          ),
                          const SizedBox(height: 30),
                          _itemFormacao(
                            'Desenvolvimento de Sistemas',
                            'Senai Roberto Mange',
                            'Cursando',
                          ),
                          const Divider(height: 30),
                          _itemFormacao(
                            'Técnica em Informática para Internet',
                            'Etec de Monte Mor',
                            'Concluído',
                          ),
                        ],
                      ),
                    ),
                  ),

                 BotaoModal(
                    texto: 'Tecnologias',
                    imagem: 'tecnologia',
                    cor: const Color(0xFFA6CFE2),
                    conteudoModal: Container(
                      padding: const EdgeInsets.all(25),
                      height: 500,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Minhas Tecnologias',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Serif',
                              color: Color(0xFF3163BA),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 5,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              children: [
                                _itemTecnologia('assets/react.png', 'React'),
                                _itemTecnologia('assets/django.png', 'Django'),
                                _itemTecnologia('assets/python.png', 'Python'),
                                _itemTecnologia('assets/mysql.png', 'MySQL'),
                                _itemTecnologia('assets/html.png', 'HTML'),
                                _itemTecnologia('assets/css.png', 'CSS'),
                                _itemTecnologia('assets/java.png', 'Java'),
                                _itemTecnologia('assets/js.png', 'JavaScript'),
                                _itemTecnologia('assets/flutter.png', 'Flutter'),
                                _itemTecnologia('assets/figma.png', 'Figma'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  BotaoModal(
                    texto: 'Curiosidade',
                    imagem: 'curiosidade',
                    cor: const Color(0xFF88A6C9),
                    conteudoModal: Container(
                      padding: const EdgeInsets.all(25),
                      height: 550,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Minhas Curiosidades',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Serif',
                              color: Color(0xFF3163BA),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Além da tecnologia, uma das minhas grandes paixões é a Nail Art. Adoro expressar a minha criatividade através de desenhos detalhados nas unhas, onde faço questão de desenhar tudo à mão livre.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Expanded(
                            child: Row(
                              children: [
                                _itemFotoCuriosidade('assets/unha.png'),
                                const SizedBox(width: 15),
                                _itemFotoCuriosidade('assets/unha1.png'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: altura * 0.02),

                  Text(
                    'Projetos',
                    style: TextStyle(
                      fontSize: largura * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),

                  SizedBox(height: altura * 0.02),

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

Widget _itemFormacao(String curso, String instituicao, String status) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(Icons.school_outlined, color: Color.fromARGB(255, 240, 119, 214), size: 30),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              curso,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 194, 58, 164)
              ),
            ),
            Text(
              instituicao,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: status == 'Cursando' ? const Color.fromARGB(113, 247, 175, 229) : const Color.fromARGB(183, 237, 195, 245),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: status == 'Cursando' ? const Color.fromARGB(255, 216, 38, 163) : const Color.fromARGB(255, 141, 54, 212),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _itemTecnologia(String caminho, String nome) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Image.asset(
          caminho,
          fit: BoxFit.contain,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        nome,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3163BA),
        ),
      ),
    ],
  );
}

Widget _itemFotoCuriosidade(String caminho) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          caminho,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}