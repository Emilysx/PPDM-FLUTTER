import 'package:flutter/material.dart';
import '../services/banco_local.dart';

class ControladorFavoritos {
  static final ValueNotifier<List<Map<String, dynamic>>> itens = 
      ValueNotifier<List<Map<String, dynamic>>>([]);

  // Carrega os favoritos chamando o BancoLocal
  static Future<void> carregarFavoritos() async {
    List<Map<String, dynamic>> listaRecuperada = await BancoLocal.carregarLista('favoritos_salvos');
    itens.value = listaRecuperada;
  }

  static bool eFavorito(String id) {
    return itens.value.any((item) => item["id"].toString() == id);
  }

  // Altera e manda salvar no BancoLocal
  static void alternarFavorito(Map<String, dynamic> produto) async {
    final id = produto["id"].toString();
    final listaAtual = List<Map<String, dynamic>>.from(itens.value);
    
    final existe = listaAtual.any((item) => item["id"].toString() == id);

    if (existe) {
      listaAtual.removeWhere((item) => item["id"].toString() == id);
    } else {
      listaAtual.add(produto);
    }
    
    itens.value = listaAtual;

    // Salva na chave 'favoritos_salvos' usando o arquivo separado
    await BancoLocal.salvarLista('favoritos_salvos', listaAtual);
  }
}