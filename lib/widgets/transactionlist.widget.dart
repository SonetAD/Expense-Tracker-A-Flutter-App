import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: transactions
              .map((t) => Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(17)),
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(right: 40),
                              child: Text(
                                '\$${t['amount']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                          Column(
                            children: [
                              Text(t['title']),
                              Text(t['time']),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
