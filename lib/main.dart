import 'package:flutter/material.dart';
import 'form.dart';
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
  final List<Widget> pages = [
    MyHomePage(),
    Formulario(),
  ];
  int indexAtual = 0;
  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              indexAtual = index;
            });
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
          ],
        ),
      ),
    );
  }
}
