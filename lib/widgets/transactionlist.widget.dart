import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColorDark),
                borderRadius: BorderRadius.circular(17)),
            child: Card(
              child: Row(
                children: [
                  Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        "\$${transactions[i]['amount'].toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Column(
                    children: [
                      Text(
                        transactions[i]['title'],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(transactions[i]['time']),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
