import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefExample extends StatefulWidget{
  const SharedPrefExample({super.key});

  @override
  State<SharedPrefExample> createState() => _SharedPrefExampleState();
}

class _SharedPrefExampleState extends State<SharedPrefExample> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter') ?? 0;
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      prefs.setInt('counter', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        }, 
        child: const Icon(Icons.add),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter:', 
            style: TextStyle(fontSize: 20.0),
            ),
            Text(
              counter.toString(),
            style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}