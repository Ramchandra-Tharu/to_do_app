import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';

class ToDoItems extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;
  const ToDoItems({
    super.key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: IconButton(
              color: Colors.white,
              iconSize: 15,
              icon: Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
                // onDeleteItem(todo.id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
