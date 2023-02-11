// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Bag",
      amount: 1069.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Junk Food",
      amount: 721,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    transaction.amount.toString(),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(transaction.title),
                    Text(transaction.date.toString()),
                  ],
                ),
              ]),
            );
          }).toList()),
        ],
      ),
    );
  }
}
