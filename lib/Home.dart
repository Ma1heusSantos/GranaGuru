import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

// eu tenho que colocar na pagina principal o header e a bottom bar e ir mudando somente o conteudo.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          MyCard(
            greeting: '',
            balance: '',
          ),
          cardEquilibrio()
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String greeting;
  final String balance;

  MyCard({
    Key? key,
    required this.greeting,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: Colors.white,
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
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("R\$ 4500.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
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
      ),
    );
  }
}

class cardEquilibrio extends StatelessWidget {
  cardEquilibrio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Equilibrio Financeiro",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.info, color: Colors.grey, size: 14),
                        Text(
                          "saiba mais",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gasto Total:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          constraints:
                              BoxConstraints(minWidth: 100, minHeight: 10),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            color: Color.fromRGBO(2, 177, 60, 1),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Limite recomendado: R\$ 1000.00 ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text("R\$ 1400.00",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
