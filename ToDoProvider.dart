import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Models/todoModel.dart';
class todoP extends ChangeNotifier{
  String title='';
  List<todo> _todos = [];
  List<todo> get todos => _todos;
  void addToDo(todo ToDo){
    _todos.add(ToDo);
    notifyListeners();
  }
  void editToDo(int ind,todo ToDo){
    _todos[ind] = ToDo;
    notifyListeners();
  }
  void deleteToDo(int ind){
    _todos.removeAt(ind);
    notifyListeners();
  }
  void toggle(todo ToDo) {
    ToDo.isMarked = !ToDo.isMarked;
    notifyListeners();
  }
  List<todo> SearchTodos(String query){
    return _todos.where((e)=>
        e.title.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

}
