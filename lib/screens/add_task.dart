import 'package:aplikasi_todo_list/constants/colors.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function(String) onTaskAdded;

  AddTask({required this.onTaskAdded});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), 
                minimumSize: Size(double.infinity, 0),
                backgroundColor: tdBlue,
              ),
              onPressed: () {
                String task = _taskController.text;
                if (task.isNotEmpty) {
                  onTaskAdded(task);
                  Navigator.pop(context);
                }
              },
              child: Text('Submit', style: TextStyle(fontSize: 13, color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}