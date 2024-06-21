import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  final String id;
  final String initialDescricao;
  final double initialValor;
  final String initialCategoria;
  final void Function(String, String, double, String) onSubmit;

  const EditForm({
    Key? key,
    required this.id,
    required this.initialDescricao,
    required this.initialValor,
    required this.initialCategoria,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  late String categoria;
  late TextEditingController descricaoController;
  late TextEditingController valorController;

  @override
  void initState() {
    super.initState();
    categoria = widget.initialCategoria;
    descricaoController = TextEditingController(text: widget.initialDescricao);
    valorController =
        TextEditingController(text: widget.initialValor.toString());
  }

  void _submitForm() {
    final descricao = descricaoController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;

    if (descricao.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmit(widget.id, descricao, valor, categoria);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edite seu gasto:', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                controller: valorController,
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              DropdownButton<String>(
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
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                isExpanded: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(2, 177, 60, 1),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
