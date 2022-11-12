import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/view/widgets/todo_tile.dart';
import '../widgets/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final hiveBox = Hive.box('HiveBox');
  final _taskController = TextEditingController();
  bool checkBoxPressed = false;
  ToDoDatabase getData = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (hiveBox.get(getData.LIST_KEY) == null) {
      getData.createInitialData();
    } else {
      getData.getSavedData();
    }
  }

  //save new task
  void saveTask() {
    setState(() {
      getData.toDoList.add([_taskController.text, false]);
      _taskController.clear();
    });
    getData.saveData();
    Navigator.of(context).pop();
  }

  //checkbox check
  void chechBoxChanged(bool? value, int index) {
    setState(() {
      getData.toDoList[index][1] = !getData.toDoList[index][1];
    });
    getData.saveData();
  }

  // function for add new task
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: _taskController,
            save: saveTask,
            cancel: (() => Navigator.of(context).pop()));
      },
    );
  }

  //function to delete task
  void deleteTask(int index) {
    setState(() {
      getData.toDoList.removeAt(index);
    });
    getData.saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          shape:const  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.amber[300],
          onPressed: addTask,
          child:const  Icon(Icons.add,color: Colors.black,),
        ),
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          elevation: 0,
          title:  Text(
            'TO DO',
            style: TextStyle(
                color: Colors.amber[300],
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: -0.3),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: getData.toDoList.length,
          itemBuilder: (context, index) => ToDoTile(
            taskName: getData.toDoList[index][0],
            isTaskCompleted: getData.toDoList[index][1],
            onChnaged: (value) => chechBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          ),
        ));
  }
}
