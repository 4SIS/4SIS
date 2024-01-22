//student version
import 'package:flutter/material.dart';
import 'package:fsis/screens/students/course/course_calendar_student.dart';
import 'package:fsis/screens/students/main_page_student.dart';

class AddClassStudent extends StatefulWidget {
  const AddClassStudent({Key? key}) : super(key: key);

  @override
  _AddClassStudentState createState() => _AddClassStudentState();
}

class _AddClassStudentState extends State<AddClassStudent> {
  // You can use controllers to get the text input from TextFormField widgets
  final TextEditingController _classCode = TextEditingController();

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
            buildInputField('수업명', _classCode),
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
                        pageBuilder: (context, animation, secondaryAnimation) => MainPageStudent(),
                        transitionDuration: Duration.zero, // Instant transition
                      ),
                    );
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage())); // Replace '/profile' with your actual profile page route
                  },
                  child: const Text('취소'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle finish button click
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => CourseCalendarStudent(),
                        transitionDuration: Duration.zero, // Instant transition
                      ),
                    );
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CourseCalendar()));
                  },
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