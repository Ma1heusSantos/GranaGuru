import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: AppBar(
            backgroundColor: Colors.purple,
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
        body: const MyCard(),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String greeting;
  final String balance;

  const MyCard({
    Key? key,
    required this.greeting,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  child: Icon(Icons.account_circle, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  greeting,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Icon(Icons.notifications),
            const SizedBox(height: 20),
            Text(
              "Saldo Geral:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              balance,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
