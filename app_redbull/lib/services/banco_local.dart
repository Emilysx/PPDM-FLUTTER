import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BancoLocal {
  // --- PERSISTÊNCIA DO PERFIL ---
  
  // Salva o nome e e-mail na gaveta local
  static Future<void> salvarPerfil(String nome, String email) async {
    final dados = await SharedPreferences.getInstance();
    await dados.setString('perfil_nome', nome);
    await dados.setString('perfil_email', email);
  }

  // Recupera os dados do perfil (Retorna um Map com os dados ou os valores padrão)
  static Future<Map<String, String>> carregarPerfil() async {
    final dados = await SharedPreferences.getInstance();
    String nome = dados.getString('perfil_nome') ?? "User Red Bull";
    String email = dados.getString('perfil_email') ?? "user.redbull@email.com";
    return {"nome": nome, "email": email};
  }

  // --- PERSISTÊNCIA GENÉRICA PARA LISTAS (Favoritos e Carrinho) ---
  
  // Salva qualquer lista de Maps convertendo para texto (JSON) igual a lógica do professor
  static Future<void> salvarLista(String chave, List<Map<String, dynamic>> lista) async {
    final dados = await SharedPreferences.getInstance();
    // Converte a lista de objetos para uma lista de Strings (Textos)
    List<String> listaStrings = lista.map((item) => jsonEncode(item)).toList();
    await dados.setStringList(chave, listaStrings);
  }

  // Carrega qualquer lista transformando o texto de volta para Objeto/Map
  static Future<List<Map<String, dynamic>>> carregarLista(String chave) async {
    final dados = await SharedPreferences.getInstance();
    List<String> listaStrings = dados.getStringList(chave) ?? [];
    
    return listaStrings.map((item) {
      return jsonDecode(item) as Map<String, dynamic>;
    }).toList();
  }
}