//this screen is for calendar of each course
import 'package:flutter/material.dart';
import 'package:fsis/screens/teachers/profile_page_teacher.dart';
import 'package:fsis/screens/teachers/course/add_class_teacher.dart';
import 'package:fsis/screens/teachers/main_page_teacher.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/main_calendar.dart';

class CourseCalendarTeacher extends StatefulWidget {
  const CourseCalendarTeacher({Key? key}) : super(key: key);

  @override
  State<CourseCalendarTeacher> createState() => _CourseCalendarScreenState();
}

class _CourseCalendarScreenState extends State<CourseCalendarTeacher>{
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('STUDULER'),
        actions: [
          IconButton(
              onPressed: () {
                //_auth.signOut();
              },
              icon: const Icon(Icons.circle_notifications, color: Colors.black))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          width: 65,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.home),
                onPressed: () {
                  //navigate to the home page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPageTeacher())); // Replace '/profile' with your actual profile page route
                },),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.person_2_rounded),
                onPressed: () {
                  //navigate to the profile page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePageTeacher())); // Replace '/profile' with your actual profile page route
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddClassTeacher())); // Replace '/profile' with your actual profile page route
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),

      //code for calendar should be placed in here
      body: MainCalendar(
        selectedDate: selectedDate,
        onDaySelected: onDaySelected,
      ),
    );
  }

  // 달력에서 날짜가 선택됐을 때 호출되는 콜백 함수
  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState( () {
      this.selectedDate = selectedDate;
    });
  }
}
