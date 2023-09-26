import 'package:flutter/material.dart';

class AddClass extends StatelessWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('List of Classes'),
        actions: [
          IconButton(
              onPressed: () {
                //_auth.signOut();
              },
              icon: const Icon(Icons.circle_notifications, color: Colors.black))
        ],
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
      /*body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red,),
        width: 150, height: 200,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text('hihihihihihihi',),
        /*child: TextFormField(decoration:InputDecoration(
        prefixIcon: Icon(Icons.~),
        )),*/
      ),
      bottomNavigationBar: BottomAppBar(child: Text('hi')),*/
    );
  }
}
