import 'package:flutter/material.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screens/TasksManager.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
 Future<Database> database;
 String taskstable = 'create table tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER DEFUALT 0)';
main() async {
  WidgetsFlutterBinding.ensureInitialized();
   database =
      openDatabase(join(await getDatabasesPath(), 'tasks.db'), version: 1,
      
          onCreate: (db, version) {
    return db.execute(taskstable);
  });
  runApp(Tasks());
}

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksManager(),
      ),
    );
  }
}
