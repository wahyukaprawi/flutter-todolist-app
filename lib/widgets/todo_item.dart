// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:aplikasi_todo_list/model/todo.dart';
import 'package:aplikasi_todo_list/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {super.key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (() {
          onToDoChanged(todo);
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: deleteToDo(),
      ),
    );
  }

  Widget deleteToDo() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 35,
      decoration:
          BoxDecoration(color: tdRed, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        color: Colors.white,
        iconSize: 18,
        icon: const Icon(Icons.delete),
        onPressed: () {
          debugPrint("delete clicked !.");
          onDeleteItem(todo.id);
        },
      ),
    );
  }
}