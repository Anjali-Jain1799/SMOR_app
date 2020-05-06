import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/Storage/Faculty_timetable.dart';
import 'package:flutterapp/Screen/Home/Storage/Other_info.dart';
import 'package:flutterapp/Screen/Home/Storage/faculty_details.dart';
import 'package:flutterapp/Screen/Home/Storage/student_timetable.dart';
import 'package:flutterapp/Screen/Home/Database/notices.dart';
import 'package:flutterapp/Screen/Home/Database/student_announcement.dart';
import 'package:flutterapp/Screen/Home/Database/teacher_announcement.dart';



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
                child:  Text('With this application you can add new notices and announcement. Also Faculty Details, Faculty Time Table and Student Time Table '
                    'can also be modified. All these changes and additions will be displayed on the Smart Mirror',
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
              title: new Text('Faculty Details'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Faculty_Details())
                );
              },
            ),
            new ListTile(
              title: new Text('Faculty Time Table'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new FacultyTimeTable())
                );
              },
            ),
            new ListTile(
              title: new Text('Student Time Table'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new StudentTimeTable())
                );
              },
            ),
            new ListTile(
              title: new Text('Other Information'),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Other_info())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
