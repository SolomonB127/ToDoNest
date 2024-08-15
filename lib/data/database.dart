import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  //list task
  List toDoTask = [];

  // Reference the Hive Box
  final _storageBox = Hive.box('storage');

  // run this if app is opened for the first time ever (default values)
  void createInitialData() {
    toDoTask = [
      ["Add things to do", false],
    ];
  }

  // load Data from Db
  void loadData() {
    toDoTask = _storageBox.get("TODOLIST");
  }

  // Update Data from Db
  void updateData() {
    _storageBox.put("TODOLIST", toDoTask);
  }
}
