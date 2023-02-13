// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses_Tracker',
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
      amount: 7211.25,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses_Tracker'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Add Transaction"),
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
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
                      color: Colors.purple,
                      width: 3,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '₹${transaction.amount}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transaction.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMMMd().format(transaction.date),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
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
