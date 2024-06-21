import 'package:flutter/material.dart';
import '../models/gasto.dart';

class GastoList extends StatelessWidget {
  final List<Gasto> gastos;

  const GastoList({Key? key, required this.gastos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gastos.map((gasto) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  gasto.getIconForCategory(gasto.categoria),
                  SizedBox(width: 15.0),
                  Text(gasto.categoria ?? "Sem categoria"),
                ],
              ),
              Text(
                "R\$ ${gasto.valor.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
