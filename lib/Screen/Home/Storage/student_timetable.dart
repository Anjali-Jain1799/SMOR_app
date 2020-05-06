import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/Storage/loaduplaod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class StudentTimeTable extends StatefulWidget {
  @override
  _StudentTimeTableState createState() => _StudentTimeTableState();
}

class _StudentTimeTableState extends State<StudentTimeTable> {
  List<String> fname = ['ece_a_fourth_year','ece_b_fourth_year','ece_a_third_year','ece_b_third_year','ece_a_second_year','ece_b_second_year'];
  List<String> pname = ['ECE A Fourth Year','ECE B Fourth Year','ECE A Third Year','ECE B Third Year','ECE A Second Year','ECE B Second Year'];
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            'Student Time Table',
            style: TextStyle(
              fontSize: 30.0,)
        ),

      ),
      body: ListView.builder(
        itemCount: fname.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pname[index]),
            trailing: Wrap(
              spacing: 0, // space between two icons
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => Firebase_Upload(),
                        settings: RouteSettings(
                            arguments: '/Time_table/students_time_table/'+fname[index]+'.png'
                        ))
                    );
                  },
                ),

                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => Firebase_Download(),
                        settings: RouteSettings(
                            arguments: '/Time_table/students_time_table/'+fname[index]+'.png'
                        ))
                    );
                  },
                ),
              ],
            ),

          );
        },
      ),
    );
  }

}

