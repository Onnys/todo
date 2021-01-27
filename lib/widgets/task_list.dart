import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return FutureBuilder<List<Task>>(
          future: taskData.tasks,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: taskData.taskCount,
                itemBuilder: (context, index) {
                  return TaskTile(
                    title: snapshot.data[index].title,
                    isChecked:snapshot.data[index].checked,
                    toogled: (value) {
                      taskData.updateTask(value, index);
                    },
                    deleteTask: () {
                      taskData.deleteTask(snapshot.data[index]);
                    },
                  );
                });
          },
        );
      },
    );
  }
}
