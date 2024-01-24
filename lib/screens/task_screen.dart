import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/common_box.dart';
import 'package:todoey_app/screens/bottom_sheet_screen.dart';
import 'package:todoey_app/task_tile.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            isScrollControlled: true,
            builder: (context) {
            return const SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 15.0),
            child: BottomSheetScreen());
          },
          );
        }, 
      shape: const CircleBorder(),
      backgroundColor: Colors.teal,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0,
      ),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                 child: Icon(
                  Icons.list,
                  color: Colors.teal,
                  size: 40.0,
                 )),
                 const SizedBox(
                  height: 10.0,
                 ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 55.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                Text(
                  '${Provider.of<CommonBox>(context).taskCount} Tasks',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TaskList(),
              ),
            ),
        ],
          ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<CommonBox>(context).loadTasks();
    return ListView.builder(
      itemBuilder: (context, index) {
        final taskTrueContext = Provider.of<CommonBox>(context);
        final taskFalseContext = Provider.of<CommonBox>(context, listen: false);
        return TaskTile(
          taskTitle: taskTrueContext.tasks[index].name,
          isChecked: taskTrueContext.tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            taskFalseContext.updateTask(
              taskFalseContext.tasks[index]);
          },
          longPressCallBack: () {
            taskFalseContext.deleteTask(
              taskFalseContext.tasks[index]);
          },
          );
    },
    itemCount: Provider.of<CommonBox>(context).taskCount,
    );
  }
}



