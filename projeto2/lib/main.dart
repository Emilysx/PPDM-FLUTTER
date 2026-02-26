import 'package:flutter/material.dart';

void main() { // função principal que executa o codigo.
  // runapp :  roda o app
  runApp(TelaContador());
}

class TelaContador extends StatefulWidget {
  // Você coloca os parametros para sua tela aqui


  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  // Aqui você coloca a sua logica em dart

  int contador = 0; //variavel que ira mostar o numero na tela 

  void add(){
    setState(() {
      contador++; // aumenta 1 unidade do valor da variavel
    });
  }

  void diminuir(){
    setState(() {
      if (contador > 0){
      contador--; // diminui 1 unidade do valor da variavel
      }
    });
  }

   void rest(){
    setState(() {
      contador = 0; // o contador volta para o 0.
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp( // importa todos os Widgets/componentes exemplo: texto, botão, navbar...
    home: Scaffold( // ele permite separar ate em 3 partes
      appBar: AppBar(title: Text("App Contador")),
      body: Center( // ajuda a centalizar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$contador"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 167, 143, 235)), onPressed: add, child: Icon(Icons.add)),
              TextButton(onPressed: diminuir, child: Icon(Icons.remove)),
              TextButton(onPressed: rest, child: Icon(Icons.refresh))
              ],)
          ],
        ),

      ),



    )


    );
  }
}
