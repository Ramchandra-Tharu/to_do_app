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
      ToDo(id: "03", todoText: "Study"),
      ToDo(id: "04", todoText: "Football training"),
      ToDo(id: "05", todoText: " meeting"),
      ToDo(id: "06", todoText: "familly time"),
      ToDo(id: "07", todoText: " study"),
      ToDo(id: "08", todoText: " sleeping"),
    ];
  }
}
