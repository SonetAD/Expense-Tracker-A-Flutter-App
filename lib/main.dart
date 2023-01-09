import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/addtask.widget.dart';
import './widgets/transactionlist.widget.dart';

void main() => runApp(MaterialApp(home: const HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List transactions = [];
  String currentTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  void addTaskBtn(String title, double amount) {
    final newTransaction = {
      'title': title,
      'amount': amount,
      'time': currentTime()
    };

    setState(() {
      transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => AddTask(addTaskBtn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          appBarTheme:
              AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'Open Sans'))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expense Tracker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
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
              TransactionList(transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
