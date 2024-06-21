import 'dart:math';
import 'package:flutter/material.dart';
import 'components/gasto_form.dart';
import 'components/edit_gasto.dart';
import './models/gasto.dart';
import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Gasto> gastos = [
    Gasto(id: '0', descricao: "Feira", valor: 200.0, categoria: "Supermarket"),
    Gasto(
        id: '1',
        descricao: "Conta de Luz",
        valor: 100.0,
        categoria: "Eletric Bill"),
    Gasto(
        id: '2',
        descricao: "Cartão de Crédito",
        valor: 800.0,
        categoria: "Credit Card"),
  ];

  void _addGasto(String descricao, double valor, String categoria) {
    final newGasto = Gasto(
      id: Random().nextDouble().toString(),
      descricao: descricao,
      valor: valor,
      categoria: categoria,
    );
    setState(() {
      gastos.add(newGasto);
    });
  }

  int indexAtual = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MyHomePage(gastos: gastos),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: AppBar(
            backgroundColor: Color.fromRGBO(2, 177, 60, 1),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(Icons.account_circle,
                        color: Colors.white, size: 70),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Bem Vindo Matheus",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(Icons.notifications,
                        color: Colors.white, size: 50),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: pages[indexAtual],
        bottomNavigationBar: Builder(
          builder: (BuildContext context) {
            return BottomNavigationBar(
              onTap: (index) {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Formulario(onSubmit: _addGasto),
                    ),
                  ).then((_) {
                    setState(() {
                      indexAtual = 0;
                    });
                  });
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditGastoPage(gastos: gastos),
                    ),
                  ).then((_) {
                    setState(() {
                      indexAtual = 0;
                    });
                  });
                } else {
                  setState(() {
                    indexAtual = index;
                  });
                }
              },
              currentIndex: indexAtual,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Adicionar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit_square),
                  label: 'Edit',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
