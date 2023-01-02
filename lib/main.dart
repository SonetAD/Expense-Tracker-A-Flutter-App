import 'package:flutter/material.dart';
import './widgets/populateTaskList.widget.dart';

void main() => runApp(MaterialApp(home: const HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => PopulateTransactionList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expense Tracker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Chart
              Container(
                padding: const EdgeInsets.all(10),
                child: const Card(
                  child: Text('CHART'),
                ),
              ),
              // Body
              PopulateTransactionList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context),
        ),
      ),
    );
  }
}
