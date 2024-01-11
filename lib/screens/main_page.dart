import 'package:flutter/material.dart';
import 'package:fsis/screens/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage())); // Replace '/profile' with your actual profile page route
                },),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(),
                icon: Icon(Icons.person_2_rounded),
                onPressed: () {
                  //navigate to the profile page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Replace '/profile' with your actual profile page route
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
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),


      body: SafeArea(
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
}