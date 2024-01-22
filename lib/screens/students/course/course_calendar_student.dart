//this screen is for calendar of each course
import 'package:flutter/material.dart';
import 'package:fsis/screens/teachers/profile_page_teacher.dart';
import 'package:fsis/screens/teachers/course/add_class_teacher.dart';
import 'package:fsis/screens/teachers/main_page_teacher.dart';

class CourseCalendarTeacher extends StatelessWidget {
  const CourseCalendarTeacher({Key? key}) : super(key: key);

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
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => MainPageTeacher(),
                      transitionDuration: Duration.zero, // Instant transition
                    ),
                  );
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage())); // Replace '/profile' with your actual profile page route
                },),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.person_2_rounded),
                onPressed: () {
                  //navigate to the profile page
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => ProfilePageTeacher(),
                      transitionDuration: Duration.zero, // Instant transition
                    ),
                  );
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Replace '/profile' with your actual profile page route
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
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => AddClassTeacher(),
                  transitionDuration: Duration.zero, // Instant transition
                ),
              );
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddClass())); // Replace '/profile' with your actual profile page route
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

    );
  }
}
