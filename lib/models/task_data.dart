import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'helo from beira'),
    Task(title: 'helo from cumbana'),
    Task(title: 'helo fro west cost'),
    Task(title: 'helo from other side'),
  ];
  UnmodifiableListView<Task> get tasks{
    return  UnmodifiableListView(_tasks);
  }
  int get taskCount{
    return _tasks.length;
  }
  void addTask(Task task) {
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
