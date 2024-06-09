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
        body: const MyCard(
          greeting: '',
          balance: '',
        ),
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
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 4.0,
                                  color: Color.fromRGBO(2, 177, 60, 1)))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Saldo Geral:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("R\$ 4500.00"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Icon(Icons.visibility_off)
              ],
            ),
            SizedBox(
                height: 20), // Espaço entre o container e a linha horizontal
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meus Gastos :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 15.0),
                    Text("Supermarket"),
                  ],
                ),
                Text(
                  "R\$ 500.00",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.receipt_long),
                    SizedBox(width: 10),
                    Text("Electricity bill"),
                  ],
                ),
                Text(
                  "R\$ 200.00",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(width: 10),
                    Text("Credit card"),
                  ],
                ),
                Text(
                  "R\$ 1000.00",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
