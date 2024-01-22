//teacher version
import 'package:flutter/material.dart';
import 'package:fsis/screens/teachers/main_page_teacher.dart';
import 'package:fsis/screens/teachers/course/course_calendar_teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final TextEditingController _numberOfClassesController = TextEditingController();

  Future<void> addClassToFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid;
      // Reference to the 'classes' collection in Firestore
      CollectionReference classesCollection =
      FirebaseFirestore.instance.collection('classes');

      // Add a new document with a generated ID
      await classesCollection.add({
        'userId': userId,
        'className': _classNameController.text,
        'studentName': _studentNameController.text,
        'age': _ageController.text,
        'course': _courseController.text,
        'numberOfClasses': _numberOfClassesController.text,
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the back button
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
      body: Padding(
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
            buildInputField('수업 회차', _numberOfClassesController),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle cancel button click
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => MainPageTeacher(),
                        transitionDuration: Duration.zero, // Instant transition
                      ),
                    );
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage())); // Replace '/profile' with your actual profile page route
                  },
                  child: const Text('취소'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: addClassToFirestore,
                  child: const Text('완료'),
                ),
              ],
            ),
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
              hintText: '$labelText',
            ),
          ),
        ],
      ),
    );
  }
}
