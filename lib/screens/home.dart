import 'package:flutter/material.dart';
import 'package:aplikasi_todo_list/constants/colors.dart';
import 'package:aplikasi_todo_list/model/todo.dart';
import 'package:aplikasi_todo_list/widgets/todo_item.dart';
import 'package:aplikasi_todo_list/widgets/build_appbar.dart';
import 'package:aplikasi_todo_list/widgets/searchbox.dart';
import 'package:aplikasi_todo_list/screens/add_task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchBox(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        'DO It',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: todosList.isEmpty
                        ? const Center(
                            child: Text(
                              'Empty task history',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView(
                            children: [
                              for (ToDo todoo in todosList)
                                ToDoItem(
                                  todo: todoo,
                                  onToDoChanged: handleToDoChange,
                                  onDeleteItem: deleteToDoItem,
                                ),
                            ],
                          ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: addTaskButton(context),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todoController.clear();
  }

  Widget addTaskButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 0),
          backgroundColor: tdBlue,
        ),
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Text('Add Task',
            style: TextStyle(fontSize: 13, color: Colors.white)),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTask(onTaskAdded: addToDoItem);
      },
    );
  }
}
