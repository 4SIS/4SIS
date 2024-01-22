import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:fsis/screens/login/login_test.dart';
import 'package:fsis/screens/teachers/main_page_teacher.dart';
import 'package:fsis/screens/login/login_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePageTeacher extends StatefulWidget {
  const ProfilePageTeacher({Key? key}) : super(key: key);

  @override
  _ProfilePageTeacherState createState() => _ProfilePageTeacherState();
}

class _ProfilePageTeacherState extends State<ProfilePageTeacher> {
  late String userName; // Variable to store the user name
  late int size;

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the widget is created
  }

  Future<void> fetchUserData() async {
    try {
      firebase_auth.User? user = firebase_auth.FirebaseAuth.instance.currentUser;
      String userId = user!.uid; // Replace with the user's ID
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).collection('classes').get();

      size = querySnapshot.size;

      // Fetch user data from Firestore
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

      // Update the UI with the user's data
      setState(() {
        userName = userSnapshot['name'];
      });
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
    }
  }
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
          ),
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
                '마이페이지',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            /*CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile/person.jpeg'),
            ),*/
            // User Information
            Text(
              '사용자 이름: $userName', // Replace with actual user name
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '진행 중인 수업: $size', // Replace with actual number of classes
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),

            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Navigate to login page
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => LoginTest(),
                    transitionDuration: Duration.zero, // Instant transition
                  ),
                );
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
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
                  // Navigate to the home page
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => MainPageTeacher(),
                      transitionDuration: Duration.zero, // Instant transition
                    ),
                  );
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.person_2_rounded),
                onPressed: () {
                  // Navigate to the profile page
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => ProfilePageTeacher(),
                      transitionDuration: Duration.zero, // Instant transition
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
