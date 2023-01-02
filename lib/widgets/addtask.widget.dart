import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  final Function addTaskBtn;

  AddTask(this.addTaskBtn);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();

  final amountContr4oller = TextEditingController();

  void addNewTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountContr4oller.text);
    if (title != '' || amount >= 0) {
      widget.addTaskBtn(title, amount);
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
