import 'package:flutter/material.dart';
import 'package:fsis/screens/login/login_test.dart';
import 'package:fsis/screens/main_page.dart';
import 'package:fsis/screens/login/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              '사용자 이름: 박근원', // Replace with actual user name
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '진행 중인 수업: 5', // Replace with actual number of classes
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
                      pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
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
                      pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
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
