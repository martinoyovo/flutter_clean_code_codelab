import 'package:clean_code_codelab/data/todo_list.dart';
import 'package:clean_code_codelab/models/todo.dart';
import 'package:clean_code_codelab/widgets/todo_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TodoDetails extends StatefulWidget {
  final Todo todo;

  const TodoDetails({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
      ),
      body: _todoDetailsBody(),
    );
  }

  Widget _todoDetailsBody() {
    const double spacing = 20;

    return SafeArea(
      minimum: const EdgeInsets.symmetric(
          vertical: spacing * 2, horizontal: spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre de taches : ${todoList.length}'),
          Text(
            'Nom de la tache: ${widget.todo.name}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(spacing),
          Text(
            'Nom de la tache: ${widget.todo.name}',
            style: const TextStyle(fontSize: 15),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: TodoButton(
              onButtonPressed: () {
                setState(() {
                  todoList.remove(widget.todo);
                });
              },
              actionName: 'Supprimer Tâche',
            ),
          )
        ],
      ),
    );
  }
}
