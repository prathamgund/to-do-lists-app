import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/common_box.dart';

 String? newTaskTitle;

class BottomSheetScreen extends StatelessWidget {
   const BottomSheetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(20.0) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 30.0,
          ),
          ),
           TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            cursorColor: Colors.teal,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal),
                  ),
                   ),
                   onChanged: (value) {
                     newTaskTitle = value;
                   },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.teal,
              ),
            ),
            onPressed: () {
              const TextStyle(color: Colors.red);
              Provider.of<CommonBox>(context, listen: false)
              .addTask(newTaskTitle!);
              Navigator.pop(context);
            }, 
            child: const Text(
              'ADD', 
              style: TextStyle(color: Colors.white),
              ),
              ),
        ]),
    );
  }
}