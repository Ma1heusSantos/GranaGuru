import 'package:flutter/material.dart';
import './edit_form.dart';
import '../models/gasto.dart';

class EditGastoPage extends StatefulWidget {
  final List<Gasto> gastos;

  const EditGastoPage({Key? key, required this.gastos}) : super(key: key);

  @override
  State<EditGastoPage> createState() => _EditGastoPageState();
}

class _EditGastoPageState extends State<EditGastoPage> {
  void _updateGasto(
      String id, String descricao, double valor, String categoria) {
    final index = widget.gastos.indexWhere((gasto) => gasto.id == id);
    if (index != -1) {
      setState(() {
        widget.gastos[index] = Gasto(
            id: id, descricao: descricao, valor: valor, categoria: categoria);
      });
    }
  }

  void _removeGasto(String id) {
    setState(() {
      widget.gastos.removeWhere((gasto) => gasto.id == id);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Gastos"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: widget.gastos.map((gasto) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  gasto.getIconForCategory(gasto.categoria),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        gasto.descricao,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(gasto.categoria,
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  Text(
                    "R\$ ${gasto.valor.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Color.fromRGBO(2, 177, 60, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditForm(
                            id: gasto.id,
                            initialDescricao: gasto.descricao,
                            initialValor: gasto.valor,
                            initialCategoria: gasto.categoria,
                            onSubmit: _updateGasto,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeGasto(gasto.id);
                    },
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
