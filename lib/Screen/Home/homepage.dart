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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('SMOR'),
                accountEmail: new Text('magicmirror.bpit@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://image.shutterstock.com/z/stock-vector-sm-initial-monogram-logo-343791287.jpg'),
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
