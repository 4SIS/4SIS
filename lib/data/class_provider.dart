import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'class_model.dart';

class ClassProvider extends ChangeNotifier {
  List<ClassModel> classes = [];

  late final CollectionReference _classesCollection;

  Future<void> addClassToFirestore(ClassModel newClass, String userId) async {
    try {
      _classesCollection = FirebaseFirestore.instance.collection('users').doc(userId).collection('classes');

      await _classesCollection.add({
        'userId': userId,
        'className': newClass.className,
        'studentName': newClass.studentName,
        'age': newClass.age,
        'course': newClass.course,
        'numberOfClasses': newClass.numberOfClasses,
        'hoursPerClass': newClass.hoursPerClass,
        'daysOfWeek': newClass.daysOfWeek,
        'hourlyRate': newClass.hourlyRate,
        'settlementFrequency': newClass.settlementFrequency,
        'themeColor': newClass.themeColor.value, // Store color as an int
      });

      classes.add(newClass);
      notifyListeners();

    } catch (e) {
      print('Error adding class to Firestore: $e');
      // Handle the error (show a message, log, etc.)
    }
  }

  void addClass(ClassModel newClass) { //can be deleted
    classes.add(newClass);
    notifyListeners();
  }

  void deleteClass(ClassModel classToDelete) {
    classes.remove(classToDelete);
    notifyListeners();
  }
}