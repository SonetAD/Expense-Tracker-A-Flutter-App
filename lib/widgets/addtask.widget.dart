import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function addTaskBtn;
  final titleController = TextEditingController();
  final amountContr4oller = TextEditingController();

  AddTask(this.addTaskBtn);

  void addNewTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountContr4oller.text);
    if (title != '' || amount >= 0) {
      addTaskBtn(title, amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          keyboardType: TextInputType.number,
          onSubmitted: (x) => this.addNewTransaction(),
          controller: amountContr4oller,
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextButton(
              onPressed: this.addNewTransaction, child: const Text('ADD')),
        )
      ]),
    );
  }
}
