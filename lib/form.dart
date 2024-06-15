import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    String categoria = 'Supermarket';
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
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
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
                iconSize: 24, // Tamanho do ícone
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
                  onPressed: () => print("apertou"),
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
