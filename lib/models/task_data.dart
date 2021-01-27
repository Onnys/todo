

import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'helo from beira'),
    Task(title: 'helo from cumbana'),
    Task(title: 'helo fro west cost'),
    Task(title: 'helo from other side'),
  ];
  Future <List<Task>> get tasks async{
    
    final Database db = await database;
    final List<Map<String, dynamic>> tasklist = await db.query('tasks');
    return  List.generate(tasklist.length, (index){
      return Task(
        id: tasklist[index]['id'],
        title: tasklist[index]['title'],
        checked: tasklist[index]['isDone']
      );
    }
    
    );
  }
  int get taskCount{
    return _tasks.length;
  }
  Future<void> addTask(Task task) async {
     final Database db = await database;
    db.insert('tasks', task.toMap());
    _tasks.add(task);
    notifyListeners();
  }
  void updateTask(bool isDone, int index){
    _tasks[index].checked = isDone;
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
