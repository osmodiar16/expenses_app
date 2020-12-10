import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_app/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 23.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 16.99, date: DateTime.now()),
  ];

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.purple,
            child: Container(
              child: Text('Chart'),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                      controller: amountController,
                      decoration: InputDecoration(labelText: 'Amount')),
                  FlatButton(
                    child: Text(
                      'Add Transaction',
                    ),
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(tx.date),
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
