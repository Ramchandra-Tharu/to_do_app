import 'package:flutter/material.dart';

class ToDo {
  String id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: "01", todoText: "Football play", isDone: true),
      ToDo(id: "02", todoText: "Study", isDone: true),
      ToDo(id: "03", todoText: "Football Training"),
      ToDo(id: "04", todoText: "DSA"),
      ToDo(id: "04", todoText: "Coding"),
    ];
  }
}
