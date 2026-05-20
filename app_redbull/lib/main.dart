import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';
import 'controllers/controlador_favoritos.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carrega os favoritos do banco local
  await ControladorFavoritos.carregarFavoritos();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}