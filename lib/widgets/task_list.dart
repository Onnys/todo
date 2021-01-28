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
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key('$snapshot.data[index].id'),
                      background: Container(
                          color: Colors.lightBlueAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.lightBlueAccent,
                                  )),
                              alignment: Alignment.centerRight,
                            ),
                          )),
                      onDismissed: (direction) {
                        taskData.deleteTask(snapshot.data[index]);
                      },
                      child: TaskTile(
                        title: snapshot.data[index].title,
                        isChecked: snapshot.data[index].checked,
                        toogled: (value) {
                          snapshot.data[index].checked = value;
                          taskData.updateTask(snapshot.data[index]);
                        },
                        deleteTask: () {},
                      ),
                    );
                  });
            }
            return Center(child: Text('Has no tasks'));
          },
        );
      },
    );
  }
}
