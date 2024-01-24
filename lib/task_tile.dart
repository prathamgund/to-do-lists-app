import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
    {super.key, 
    required this.taskTitle, 
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.longPressCallBack,
    });

  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;
  final Function() longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onLongPress: longPressCallBack,
      title:  Text(
        taskTitle,
      style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: checkBoxCallBack,
       value: isChecked, 
       fillColor: const MaterialStatePropertyAll(Colors.teal),
       checkColor: Colors.white,
    ),
    );
  }
}

 