import 'package:app_tarefas/navigation/navigation.navbar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
 
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
 
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}
 
class _SplashscreenState extends State<Splashscreen> {
  @override // garante que a função resete toda vez que iniciar o app
  // sempre a lógica antes do override
  void initState() {
    //atribuir instruções no estado inicial da tela (carregamento)
    super.initState();
    Future.delayed(
      // espera 3 segundos e depois realiza uma ação
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      },
    );
  }
 
 @override
  Widget build(BuildContext context) {
    // Definição das cores 
    const Color softBlue = Color(0xFF8CA7F4);
    const Color yuzuZest = Color(0xFFDBF48C);
    const Color pastelPurple = Color(0xFFD98CF4);
    const Color oatMilk = Color(0xFFFEF8F0);

    return Scaffold(
      
      backgroundColor: oatMilk,
      body: Stack(
        children: [
          // Forma 1
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: softBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          // Forma 2
          Positioned(
            bottom: -50,
            right: -80,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: pastelPurple.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),

          // Conteúdo Principal 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    size: 80, 
                    color: softBlue, 
                  ),
                ),
                
                const SizedBox(height: 40),

                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [softBlue, pastelPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Minhas Tarefas",
                    style: TextStyle(
                      fontSize: 36, 
                      fontWeight: FontWeight.w900, 
                      color: Colors.white, 
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10),

                // Subtítulo
                const Text(
                  "Organize seu dia",
                  style: TextStyle(
                    fontSize: 16,
                    color: softBlue,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                
                const SizedBox(height: 30),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: yuzuZest, 
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: 60),


                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: 1.0, 
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(softBlue.withOpacity(0.2)),
                      ),
                    ),
                
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor: AlwaysStoppedAnimation<Color>(yuzuZest),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              "powered by Clustr",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: softBlue.withOpacity(0.3),
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}