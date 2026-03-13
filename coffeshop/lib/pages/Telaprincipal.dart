import 'package:flutter/material.dart';
import '../components/card.dart'; 

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: Text("NOSSO MENU", 
        style:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold

        ),
        ),
        backgroundColor: Color(0xFF775537),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
               Text(
                "Escolha seu café favorito",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              
             
              Cardizinho(
                nome: "Café Expresso",
                valor: 5.50,
                imagem: "assets/cafe1.png",
              ),
              SizedBox(height: 15), // Espaço entre os cards
              
              Cardizinho(
                nome: "Cappuccino Italiano",
                valor: 12.90,
                imagem: "assets/cafe2.png",
              ),
              SizedBox(height: 15),
              
              Cardizinho(
                nome: "Mocaccino",
                valor: 15.00,
                imagem: "assets/cafe3.png",
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}