import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fsis/screens/teachers/course/course_calendar_teacher.dart';
import 'package:fsis/screens/teachers/profile_page_teacher.dart';
import 'package:fsis/screens/teachers/course/add_class_teacher.dart';
import 'package:provider/provider.dart';

import '../../data/class_model.dart';
import '../../data/class_provider.dart';

class MainPageTeacher extends StatelessWidget {
  const MainPageTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var classProvider = Provider.of<ClassProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Set this to false to remove the back button
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
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          MainPageTeacher(),
                      transitionDuration: Duration.zero, // Instant transition
                    ),
                  );

                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage())); // Replace '/profile' with your actual profile page route
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.person_2_rounded),
                onPressed: () {
                  //navigate to the profile page
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ProfilePageTeacher(),
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
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      AddClassTeacher(),
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

      /*body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              'assets/images/tung.jpeg',
              height: 280,
            ),
            Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}*/

      body: SafeArea(
        child: FutureBuilder<List<ClassModel>>(
          future: fetchClassesFromFirestore(),
          // Replace with your method to fetch data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Image.asset(
                  'assets/images/tung.jpeg',
                  height: 280,
                ),
              );
            } else {
              return ListView(
                children: snapshot.data!.map((classInfo) {
                  return GestureDetector(
                    onTap: () {
                      _showOptionsDialog(context, classProvider, classInfo);
                    },
                    child: ClassBox(classInfo: classInfo),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<ClassModel>> fetchClassesFromFirestore() async {
    try {
      // Replace 'users' with the actual collection name for user data
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid; // Replace with the user's ID
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('classes')
              .get();

      List<ClassModel> classes = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()!;
        return ClassModel(
          className: data['className'],
          studentName: data['studentName'],
          age: data['age'] as int,
          course: data['course'],
          numberOfClasses: data['numberOfClasses'] as int,
          hoursPerClass: data['hoursPerClass'] as int,
          daysOfWeek: List<String>.from(data['daysOfWeek']),
          hourlyRate: (data['hourlyRate'] ?? 0).toInt(),
          settlementFrequency: data['settlementFrequency'] as int,
          themeColor: Color(data['themeColor']),
        );
      }).toList();

      return classes;
    } catch (e) {
      // Handle errors here
      print('Error fetching classes from Firestore: $e');
      return [];
    }
  }
}

void _showOptionsDialog(
    BuildContext context, ClassProvider classProvider, ClassModel classInfo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(classInfo.className),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // 사용자가 "수업 삭제" 버튼을 눌렀을 때의 로직
                _deleteClass(context, classProvider, classInfo);
              },
              child: Text('수업 삭제'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // 사용자가 "캘린더 보기" 버튼을 눌렀을 때의 로직
                _viewCalendar(context, classInfo);
              },
              child: Text('캘린더 보기'),
            ),
          ],
        ),
      );
    },
  );
}

/*void _deleteClass(
    BuildContext context, ClassProvider classProvider, ClassModel classInfo) {
  // 수업 삭제 로직을 구현하세요
  classProvider.deleteClass(classInfo);
  Navigator.of(context).pop(); // 팝업 닫기
}*/

void _deleteClass(
    BuildContext context, ClassProvider classProvider, ClassModel classInfo) {
  // Show a confirmation dialog before deleting the class
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Class'),
        content: Text('Are you sure you want to delete this class?'),
        actions: [
          TextButton(
            onPressed: () async {
              // User confirmed, proceed with deletion

              // Delete from Firestore
              await _deleteClassFromFirestore(classInfo);

              // Delete from the local list
              classProvider.deleteClass(classInfo);

              // Close the confirmation dialog
              Navigator.of(context).pop();

              // Close the options dialog
              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // User canceled, close the confirmation dialog
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}

Future<void> _deleteClassFromFirestore(ClassModel classInfo) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    String documentId = "";

    CollectionReference<Map<String, dynamic>> classesCollection =
    FirebaseFirestore.instance.collection('users').doc(userId).collection('classes');

    // Query to get documents where 'course' field matches the specified courseName
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await classesCollection.where('className', isEqualTo: classInfo.className).get();

    // Check if there is a matching document
    if (querySnapshot.docs.isNotEmpty) {
      // Extract the document ID from the first matching document
      documentId = querySnapshot.docs.first.id;
    } else {
      // No matching document found
      return null;
    }

    // Reference to the document in Firestore
    DocumentReference<Map<String, dynamic>> classRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('classes')
        .doc(documentId);

    // Delete the document from Firestore
    await classRef.delete();
  } catch (e) {
    print('Error deleting class from Firestore: $e');
    // Handle errors here
  }
}

void _viewCalendar(BuildContext context, ClassModel classInfo) {
  // 캘린더 보기 로직을 구현하세요
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          CourseCalendarTeacher(),
      transitionDuration: Duration.zero, // Instant transition
    ),
  );
}

class ClassBox extends StatelessWidget {
  final ClassModel classInfo;

  const ClassBox({Key? key, required this.classInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            classInfo.className,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text('Student: ${classInfo.studentName}'),
          Text('Age: ${classInfo.age}'),
          Text('Course: ${classInfo.course}'),
          Text('Number of Classes: ${classInfo.numberOfClasses}'),
          // Add more details as needed
        ],
      ),
    );
  }
}
