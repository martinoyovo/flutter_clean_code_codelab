import 'package:clean_code_codelab/data/todo_list.dart';
import 'package:clean_code_codelab/models/todo.dart';
import 'package:clean_code_codelab/pages/todo_details.dart';
import 'package:clean_code_codelab/widgets/todo_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: const TodoBody(),
    );
  }
}


class TodoBody extends StatefulWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  final todoNameTextEditingController = TextEditingController();
  final todoDescriptionTextEditingController = TextEditingController();

  final double spacing = 20;

  final double iconSize = 15;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: spacing/2, vertical: spacing),
      child: ListView(
        children: [
          ...todoList.map(
              (task) => _taskItem(task)
          ).toList(),

          Gap(spacing),

          _todoTextField(
            controller: todoNameTextEditingController,
            fieldName: 'Nom'
          ),
          Gap(spacing/2),

          _todoTextField(
            controller: todoDescriptionTextEditingController,
            fieldName: 'Description',
            maxLines: 4
          ),

          Gap(spacing),

          TodoButton(
            onButtonPressed: () {
              final todo = Todo(
                  name: todoNameTextEditingController.text,
                  description: todoDescriptionTextEditingController.text
              );

              setState(() {
                todoList.add(todo);
              });
            },
            actionName: "Ajouter Tâche"
          )
        ],
      ),
    );
  }

  Widget _taskItem(Todo todo) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => TodoDetails(todo: todo)
        )
      ),
      child: Container(
        padding: EdgeInsets.all(spacing/2),
        margin: EdgeInsets.only(bottom: spacing/2),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(todo.name),

                const Spacer(),

                InkWell(
                  onTap: () {
                    setState(() {
                      todoList.remove(todo);
                    });
                  },
                  child: Icon(Icons.delete_outline, size: iconSize,)
                )
              ],
            ),
            Gap(spacing/2),
            Text(todo.description),
          ],
        ),
      ),
    );
  }

  Widget _todoTextField({required TextEditingController controller, required String fieldName, int? maxLines}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: fieldName,

      ),
      maxLines: maxLines ?? 1,
    );
  }
}
