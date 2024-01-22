import 'package:flutter/material.dart';
import 'class_model.dart';

class ClassProvider extends ChangeNotifier {
  List<ClassModel> classes = [];

  void addClass(ClassModel newClass) {
    classes.add(newClass);
    notifyListeners();
  }

  void deleteClass(ClassModel classToDelete) {
    classes.remove(classToDelete);
    notifyListeners();
  }
}