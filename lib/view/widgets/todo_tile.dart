import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChnaged;
  Function(BuildContext) deleteTask;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChnaged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber[300]),
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChnaged,
                activeColor: Colors.deepPurple,
              ),
              Text(
                taskName.toUpperCase(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration:
                        isTaskCompleted ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
