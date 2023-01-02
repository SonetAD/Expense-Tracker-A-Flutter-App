import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import './addtask.widget.dart';
import './transactionlist.widget.dart';

import 'package:intl/intl.dart';

class PopulateTransactionList extends StatefulWidget {
  const PopulateTransactionList({super.key});

  @override
  State<PopulateTransactionList> createState() =>
      _PopulateTransactionListState();
}

class _PopulateTransactionListState extends State<PopulateTransactionList> {
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [AddTask(addTaskBtn), TransactionList(transactions)],
      ),
    );
  }
}
