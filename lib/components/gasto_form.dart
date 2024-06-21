import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  final void Function(String, double, String) onSubmit;

  Formulario({required this.onSubmit});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  String categoria = 'Supermarket';
  final descricaoController = TextEditingController();
  final valorController = TextEditingController();

  void _submitForm() {
    final descricao = descricaoController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;

    if (descricao.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmit(descricao, valor, categoria);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre seu gasto:', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                controller: valorController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              DropdownButton(
                value: categoria,
                onChanged: (String? novaCategoria) {
                  setState(() {
                    categoria = novaCategoria!;
                  });
                },
                items: <String>['Supermarket', 'Credit Card', 'Eletric Bill']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                isExpanded: true,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(2, 177, 60, 1),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
