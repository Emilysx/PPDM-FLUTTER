import 'package:flutter/material.dart';

class ItemCarrinho {
  final String id;
  final String title;
  final String preco;
  final String imagem;
  int quantidade;

  ItemCarrinho({
    required this.id,
    required this.title,
    required this.preco,
    required this.imagem,
    this.quantidade = 1,
  });
}

class ControladorCarrinho {
  static final ValueNotifier<List<ItemCarrinho>> itens = ValueNotifier<List<ItemCarrinho>>([]);

  static void adicionar(Map<String, dynamic> produto) {
    final id = produto["id"].toString();
    final listaAtual = List<ItemCarrinho>.from(itens.value);
    final index = listaAtual.indexWhere((item) => item.id == id);

    if (index >= 0) {
      listaAtual[index].quantidade++;
    } else {
      listaAtual.add(ItemCarrinho(
        id: id,
        title: produto["title"] ?? "Red Bull",
        preco: produto["preco"]?.toString() ?? "0.00",
        imagem: produto["imagem"] ?? "redbull_original.png",
      ));
    }
    itens.value = listaAtual;
  }

  static void remover(String id) {
    final listaAtual = List<ItemCarrinho>.from(itens.value);
    listaAtual.removeWhere((item) => item.id == id);
    itens.value = listaAtual;
  }

  static void aumentarQuantidade(String id) {
    final listaAtual = List<ItemCarrinho>.from(itens.value);
    final index = listaAtual.indexWhere((item) => item.id == id);
    if (index >= 0) {
      listaAtual[index].quantidade++;
      itens.value = listaAtual;
    }
  }

  static void diminuirQuantidade(String id) {
    final listaAtual = List<ItemCarrinho>.from(itens.value);
    final index = listaAtual.indexWhere((item) => item.id == id);
    if (index >= 0) {
      if (listaAtual[index].quantidade > 1) {
        listaAtual[index].quantidade--;
      } else {
        listaAtual.removeAt(index);
      }
      itens.value = listaAtual;
    }
  }

  static double get valorTotal {
    double total = 0.0;
    for (var item in itens.value) {
      double precoDouble = double.tryParse(item.preco.replaceAll('R\$', '').trim()) ?? 0.0;
      total += precoDouble * item.quantidade;
    }
    return total;
  }
}