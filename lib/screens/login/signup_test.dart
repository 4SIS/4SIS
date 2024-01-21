import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_test.dart';

class User {
  final String uid;
  final String email;
  final String pwd;
  final String name;
  final bool isTeacher;

  User({
    required this.uid,
    required this.email,
    required this.pwd,
    required this.name,
    required this.isTeacher,
  });
}

class SignupTest extends StatefulWidget {
  @override
  _SignupTestState createState() => _SignupTestState();
}

class _SignupTestState extends State<SignupTest> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isTeacher = false;
  bool showExistingUserWarning = false;

  Future<void> signUp() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Additional info
      User user = User(
        uid: userCredential.user!.uid,
        email: emailController.text,
        pwd: passwordController.text,
        name: nameController.text,
        isTeacher: isTeacher,
      );

      // Store user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {
          'email': user.email,
          'password': user.pwd,
          'name': user.name,
          'isTeacher': user.isTeacher,
        },
      );

      // Navigate to the welcome page or do other actions after sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginTest(),
        ),
      );
    } catch (e) {
      // Handle sign-up errors
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        // Show the existing user warning
        setState(() {
          showExistingUserWarning = true;
        });
      } else {
        // For other errors, print the error to the console
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the back button
        backgroundColor: Color(0xFF9BA4B5),
        title: Text('STUDULER',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.white,  // Set the text color to white
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to STUDULER!',
                style: TextStyle(
                  color: Color(0xFF212A3E),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.7,
              ),
              decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Color(0xFFACA3A5))),

            ),
            TextField(
              controller: passwordController,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.7,
              ),
              decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Color(0xFFACA3A5))),
              obscureText: true,
            ),
            TextField(
              controller: nameController,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.7,
              ),
              decoration: InputDecoration(labelText: 'Username', labelStyle: TextStyle(color: Color(0xFFACA3A5))),            ),
            DropdownButtonFormField<bool>(
              value: isTeacher,
              onChanged: (value) {
                setState(() {
                  isTeacher = value!;
                });
              },
              items: [
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text('Student',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.7,
                      //color: Color(0xFFACA3A5),
                    ),
                  ),
                ),
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text('Teacher',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.7,
                      //color: Color(0xFFACA3A5),
                    ),
                  ),
                ),
              ],
            ),
            if (showExistingUserWarning)
              Text(
                'User with this email already exists.',
                style: TextStyle(
                  color: Colors.red, // Set the color as needed
                ),
              ),
            SizedBox(height: 150),
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,  // Remove default padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),  // Adjust the button border radius
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.00, 0.08),
                      end: Alignment(1, -0.08),
                      colors: [Color(0xFF252A3C), Color(0xFF9EA4B3)],
                    ),
                    borderRadius: BorderRadius.circular(20.0),  // Match the button border radius
                  ),
                  child: Container(
                    constraints: BoxConstraints(minHeight: 40.0),  // Adjust the minimum height
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/login/login.png',  // Replace 'login.png' with the actual asset path
                          height: 24,  // Adjust the height as needed
                        ),
                        SizedBox(width: 8),  // Add some space between the image and text
                        Text('회원가입',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                          ),),
                      ],
                    ),
                  ),),),
            ),
            SizedBox(height: 10),  // Add some space between the Log In button and 회원가입 text
            GestureDetector(
              onTap: () {
                // Navigate to the signup page when 회원가입 is clicked
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => LoginTest(),
                    transitionDuration: Duration.zero, // Instant transition
                  ),
                );

                //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginTest()));
              },
              child: Text.rich(
                style: TextStyle(
                  color: Color(0xFF1D1517),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
                TextSpan(
                  children: [
                    TextSpan(
                      text: '계정이 이미 있으신가요? ',
                    ),
                    TextSpan(
                      text: '로그인',
                      style: TextStyle(
                        color: Color(0xFF3F4864),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


