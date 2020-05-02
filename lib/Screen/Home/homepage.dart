import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/notices.dart';
import 'package:flutterapp/Screen/Home/storage.dart';
import 'package:flutterapp/Screen/Home/student_announcement.dart';
import 'package:flutterapp/Screen/Home/teacher_announcement.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset('assets/SMOR image.jpg'),
          ),
          Expanded(
            flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                child:  Text('Using this applicationg you can add announcment and notices for both student and staff. And all these information will be displated on the display of Smart Mirror.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
                ),
                textAlign: TextAlign.justify,),
                )
              )
          )
          ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Smart Mirror for ECE department'),
                accountEmail: new Text('magicmirror.bpit@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new AssetImage('assets/SMOR app icon.jpg'),
                ),
            ),
            new ListTile(
              title: new Text('Announcement for Students'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Student_announcement())
                );
              },
            ),
            new ListTile(
              title: new Text('Announcement for Staff Members'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Teacher_announcement())
                );
              },
            ),
            new ListTile(
              title: new Text('Notices from IPU'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Notices())
                );
              },
            ),
            new ListTile(
              title: new Text('Storage'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Storage())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
