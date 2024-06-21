import 'package:flutter/material.dart';
import './models/gasto.dart';
import 'components/gasto_list.dart';

class MyHomePage extends StatelessWidget {
  final List<Gasto> gastos;

  const MyHomePage({Key? key, required this.gastos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [MyCard(gastos: gastos), cardEquilibrio()],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final List<Gasto> gastos;

  const MyCard({Key? key, required this.gastos}) : super(key: key);

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
              GastoList(gastos: gastos)
            ],
          ),
        ),
      ),
    );
  }
}

class cardEquilibrio extends StatelessWidget {
  const cardEquilibrio({Key? key}) : super(key: key);

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
