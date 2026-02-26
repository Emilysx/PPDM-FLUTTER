import 'package:flutter/material.dart';

class Telacartao extends StatefulWidget {
  const Telacartao({super.key});

  @override
  State<Telacartao> createState() => _TelacartaoState();
}

class _TelacartaoState extends State<Telacartao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF8A05BE),
        // Para aumentar a altura da AppBar
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(117, 224, 224, 224),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/perfil.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),

                Spacer(), // empurra os itens para a direita
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/olho-fechado.png',
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 20),
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/duvida.png', fit: BoxFit.cover),
                ),

                SizedBox(width: 20),
                Container(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/novo-email.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Text(
              "Olá, Emily Gabrielle",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

       body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trasferir',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        ],
      ),

    );

  }
}