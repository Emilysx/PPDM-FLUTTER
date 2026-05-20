import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicoRedBull {
  static const String urlApi = 'https://api-redbull.onrender.com/db.json';

  static Future<List<dynamic>> buscarProdutos() async {
    try {
      final resposta = await http.get(Uri.parse(urlApi));
      if (resposta.statusCode == 200) {
        final Map<String, dynamic> dadosCompletos = jsonDecode(resposta.body);
        if (dadosCompletos.containsKey('produtos')) {
          return dadosCompletos['produtos'] as List<dynamic>;
        }
        return [];
      } else {
        throw Exception('Falha ao conectar com o servidor');
      }
    } catch (e) {
      rethrow;
    }
  }
}