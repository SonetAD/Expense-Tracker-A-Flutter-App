import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function addTaskBtn;
  final titleController = TextEditingController();
  final amountContr4oller = TextEditingController();

  AddTask(this.addTaskBtn);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: amountContr4oller,
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextButton(
              onPressed: () =>
                  addTaskBtn(titleController.text, amountContr4oller.text),
              child: const Text('ADD')),
        )
      ]),
    );
  }
}
