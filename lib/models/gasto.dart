import 'package:flutter/material.dart';

class Gasto {
  final String? id;
  final String descricao;
  final double valor;
  final String categoria;

  const Gasto(
      {this.id,
      required this.descricao,
      required this.valor,
      required this.categoria});

  Icon getIconForCategory(String categoria) {
    switch (categoria) {
      case "Supermarket":
        return Icon(Icons.shopping_cart);

      case "Eletric Bill":
        return Icon(Icons.payments);

      case "Credit Card":
        return Icon(Icons.credit_card);

      default:
        return Icon(Icons.help_outline);
    }
  }
}
