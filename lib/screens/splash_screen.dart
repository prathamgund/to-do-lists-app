import 'package:flutter/material.dart';
import 'package:todoey_app/screens/task_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), 
    () {
      Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) {
          return const TaskScreen();
        }),);
    }
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          colors: [Colors.blue, Colors.black],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list, 
                size: 80.0, 
                color: Colors.white,
                ),
                SizedBox(
                  height: 15.0,
                  ),
                Text(
                  'Todoey App', 
                  style: TextStyle(
                 fontStyle: FontStyle.italic,
                 color: Colors.white,
                 fontSize: 30.0,
                ),
                ),
            ],
          ),
      ));
  }
}