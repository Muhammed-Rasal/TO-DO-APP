import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final hiveBox = Hive.box('HiveBox');
  List toDoList = [];
  final String LIST_KEY = 'TODOlIST';


  void createInitialData() {
    toDoList = [
      ["Do Excercise", false],
      ["Drink Water", false],
    ];
  }

  void saveData() {
    hiveBox.put(LIST_KEY, toDoList);
  }

  void getSavedData() {
    toDoList = hiveBox.get(LIST_KEY) ?? ['Make reminders'];
  }
}
