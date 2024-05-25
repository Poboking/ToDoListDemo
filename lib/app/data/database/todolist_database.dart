import 'package:hive/hive.dart';
import 'package:youtube_course_demo/app/data/initial_data.dart';

class TodolistDatabase {
  List toDoList = [];

  final _box = Hive.box("box");

  void createInitialData(){
    toDoList = initialDataForToDoList;
    updateDataBase();
  }

  void loadData(){
    toDoList = _box.get("TODOLIST");
  }

  void updateDataBase(){
    _box.put("TODOLIST", toDoList);
  }

}