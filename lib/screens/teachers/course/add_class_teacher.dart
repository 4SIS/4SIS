//teacher version
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fsis/screens/teachers/main_page_teacher.dart';
import 'package:fsis/screens/teachers/course/course_calendar_teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fsis/data/class_model.dart';
import 'package:fsis/widgets/class_hours_picker.dart';
import 'package:fsis/widgets/color_picker.dart';
import 'package:fsis/widgets/selection_frequency_picker.dart';
import 'package:fsis/widgets/weekly_class_frequency_picker.dart';

import '../../../data/class_provider.dart';

class AddClassTeacher extends StatefulWidget {
  const AddClassTeacher({Key? key}) : super(key: key);

  @override
  _AddClassTeacherState createState() => _AddClassTeacherState();
}

class _AddClassTeacherState extends State<AddClassTeacher> {
  // You can use controllers to get the text input from TextFormField widgets
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  int _numberOfClasses = 0;
  List<String> _daysOfWeek = [''];
  int _hoursPerClass = 0;
  final TextEditingController _hourlyRateController = TextEditingController();
  int _settlementFrequency = 0;
  Color _themeColor = Colors.black;

  Future<void> addClassToFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid;
      // Reference to the 'classes' collection in Firestore
      CollectionReference classesCollection =
      FirebaseFirestore.instance.collection('users').doc(userId).collection('classes');

      var classProvider = Provider.of<ClassProvider>(context, listen: false);

      // Add a new document with a generated ID
      await classesCollection.add({
        //'userId': userId,
        'className': _classNameController.text,
        'studentName': _studentNameController.text,
        'age': _ageController.text,
        'course': _courseController.text,
        'numOfClasses': _numberOfClasses,
        'daysOfWeek': _daysOfWeek,
        'hoursPerClass': _hoursPerClass,
        'hourlyRate': _hourlyRateController.text,
        'settlementFrequency': _settlementFrequency,
        'themeColor': _themeColor.toString(),

        /*className: _classNameController.text,
        studentName: _studentNameController.text,
        age: int.parse(_ageController.text),
        course: _courseController.text,
        numberOfClasses: _numberOfClasses,
        daysOfWeek: _daysOfWeek,
        hoursPerClass: _hoursPerClass,
        hourlyRate: double.parse(_hourlyRateController.text),
        settlementFrequency: _settlementFrequency,
        themeColor: _themeColor,*/

        //'numberOfClasses': _numberOfClassesController.text,
      });

      // Handle success or navigate to another page if needed
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CourseCalendarTeacher(),
          transitionDuration: Duration.zero, // Instant transition
        ),
      );
    } catch (e) {
      print('Error adding class to Firestore: $e');
      // Handle the error (show a message, log, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    var classProvider = Provider.of<ClassProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('STUDULER'),
        actions: [
          IconButton(
            onPressed: () {
              //_auth.signOut();
            },
            icon: const Icon(Icons.circle_notifications, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          '수업 추가하기',
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      buildInputField('수업명', _classNameController),
      buildInputField('학생 이름', _studentNameController),
      buildInputField('학생 나이', _ageController),
      buildInputField('과목', _courseController),
      WeeklyClassFrequencyPicker(onSelected: (String selectedInfo) {
        // WeeklyClassFrequencyPicker에서 전달된 값을 처리
        // selectedInfo 형식: '주 X회, 요일1, 요일2, ...'
        List<String> infoParts = selectedInfo.split(', ');
        int frequency = int.parse(infoParts[0].substring(2, infoParts[0].indexOf('회')));
        List<String> days = infoParts.sublist(1);

        setState(() {
          _numberOfClasses = frequency;
          _daysOfWeek = days;
        });
      },

      ),
      ClassHoursPicker(
        onSelected: (int selectionHours){
          _hoursPerClass = selectionHours;
        },
      ),
      buildInputField('시급', _hourlyRateController),
      SettlementFrequencyPicker(
        onSelected: (int selectedFrequency) {
          _settlementFrequency = selectedFrequency;
        },
      ),
      ColorPickerWidget(
        onSelected: (Color selectedColor){
          _themeColor = selectedColor;
        },
      ),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(
              onPressed: () {
          // Handle cancel button click
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageTeacher())); // Replace '/profile' with your actual profile page route
    },
      child: const Text('취소'),
    ),
    const SizedBox(width: 16.0),
    ElevatedButton(
    onPressed: addClassToFirestore,
    // Handle finish button click
    /*var newClass = ClassModel(
    className: _classNameController.text,
    studentName: _studentNameController.text,
    age: int.parse(_ageController.text),
    course: _courseController.text,
    numberOfClasses: _numberOfClasses,
    daysOfWeek: _daysOfWeek,
    hoursPerClass: _hoursPerClass,
    hourlyRate: double.parse(_hourlyRateController.text),
    settlementFrequency: _settlementFrequency,
    themeColor: _themeColor,

    );

    classProvider.addClass(newClass);*/
    child: const Text('완료'),
    ),
    ],
    ),
    )
    ],
    ),
    ),
    );
  }

  Widget buildInputField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '직접 입력하세요',
            ),
          ),
        ],
      ),
    );
  }
}
