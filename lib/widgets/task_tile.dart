import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final Function toogled,deleteTask;
  final bool isChecked;
  

  TaskTile({this.title, this.isChecked, this.toogled, this.deleteTask});
  
  @override
  Widget build(BuildContext context) {
    print('$isChecked esta neste estado');
    return ListTile(
      onLongPress:deleteTask,
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: toogled),
    );
  }
}
