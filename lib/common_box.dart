import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey_app/task.dart';

class CommonBox extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount => _tasks.length;

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tasksJson = prefs.getString('tasks') ?? "[]";
    List<dynamic> taskMapList = json.decode(tasksJson);
    _tasks = taskMapList.map((map) => Task.fromMap(map)).toList();
    notifyListeners();
  }

  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tasksJson =
        json.encode(_tasks.map((task) => task.toMap()).toList());
    prefs.setString('tasks', tasksJson);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }
}
