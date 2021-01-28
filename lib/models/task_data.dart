import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  int lengthoftask = 0;
  Future<List<Task>> get tasks async {
    final Database db = await database;
    final List<Map<String, dynamic>> tasklist = await db.query('tasks');
    lengthoftask = tasklist.length;
    return List.generate(tasklist.length, (index) {
      return Task(
        id: tasklist[index]['id'],
        title: tasklist[index]['title'],
        checked: tasklist[index]['isDone'] == 0 ? false : true,
      );
    });
  }

  Future<void> addTask(Task task) async {
    final Database db = await database;
    db.insert('tasks', task.toMap());
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    final Database db = await database;
    db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    final Database db = await database;
    db.delete('tasks', where: "id = ?", whereArgs: [task.id]);
    notifyListeners();
  }
}
